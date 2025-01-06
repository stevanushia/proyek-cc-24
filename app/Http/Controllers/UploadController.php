<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class UploadController extends Controller
{
    public function index()
    {
        /* CARA 1 */
        // $pictures = Storage::disk('public')->files("pictures");

        /* CARA 2 */
        $pictures = File::files('storage/pictures');

        // dd($pictures);
        return view('tutor', compact('pictures'));
    }

    public function download(Request $request)
    {
        return Storage::disk('public')->download("pictures/" . $request->file);
    }

    public function delete(Request $request)
    {
        Storage::disk('public')->delete('pictures/' . $request->file);
        // unlink(public_path('storage/pictures/' . $request->file));
        return redirect()->back();
    }

    public function upload(Request $request)
    {
        /*
            Tidak melakukan validasi file sebelum diproses adalah hal yang berbahaya karena menimbulkan kerentanan
            Contohnya: RCE (Remote Code Execution) dimana attacker bisa mengupload file PHP yang berbahaya
            Contoh melakukan RCE
            https://www.youtube.com/watch?v=RYmYTCAkBEw
            https://www.youtube.com/watch?v=gnSMrvV5e9w
        */
        // request()->validate(['file' => 'required', 'nama' => 'required']);
        // request()->validate(['file' => 'required|file|image|mimes:jpeg,png,jpg|max:2048', 'nama' => 'required']);

        // menyimpan data file yang diupload ke variabel $file
        $file = $request->file('file');

        // nama file
        echo 'File Name: ' . $file->getClientOriginalName();
        echo '<br>';

        // ekstensi file
        echo 'File Extension: ' . $file->getClientOriginalExtension();
        echo '<br>';

        // real path
        echo 'File Real Path: ' . $file->getRealPath();
        echo '<br>';

        // ukuran file
        echo 'File Size: ' . $file->getSize();
        echo '<br>';

        // tipe mime
        echo 'File Mime Type: ' . $file->getMimeType();

        // isi dengan nama folder tempat kemana file diupload
        $tujuan_upload = 'pictures';

        /*
            Cara save file pada folder storage private
            Private tidak bisa diakses dari url / luar
        */
        // $file->storeAs($tujuan_upload, $file, $request->nama . '.' . $file->getClientOriginalExtension());
        // Storage::putFileAs($tujuan_upload, $file, $request->nama . '.' . $file->getClientOriginalExtension());

        /*
            Cara save file pada folder public
        */
        // $file->move($tujuan_upload, $file->getClientOriginalName());

        /*
            Cara save file pada storage public
            tuliskan `php artisan storage:link` pada CMD / Terminal untuk menghubungkan public dengan storage public (Cek config/filesystems.php)
        */
        Storage::disk('public')->putFileAs($tujuan_upload, $file, $request->nama . '.' . $file->getClientOriginalExtension());

        return redirect()->back();
    }
}
