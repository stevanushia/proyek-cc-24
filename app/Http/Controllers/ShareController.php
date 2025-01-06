<?php

namespace App\Http\Controllers;

use App\Models\Files;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ShareController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $userId = session('user.id');
        $files = Files::where('owner', $userId)->get();
        $users = User::where('id', '!=', $userId)->get();
        $currentFileId = $id;

        return view('share', compact('files', 'users', 'currentFileId'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function shareFile(Request $request)
    {
        $request->validate([
            'file_id' => 'required|exists:files,id',
            'user_id' => 'required|exists:users,id',
        ]);

        $existingShare = DB::table('shared_files')
            ->where('id_user', $request->user_id)
            ->where('id_file', $request->file_id)
            ->first();

        if (!$existingShare) {
            DB::table('shared_files')->insert([
                'id_user' => $request->user_id,
                'id_file' => $request->file_id,
            ]);
        }

        return redirect()->route('dashboardView')->with('success', 'File shared successfully!');
    }

}
