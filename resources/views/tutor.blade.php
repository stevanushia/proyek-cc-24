<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Upload</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <h2 class="text-center my-5">Upload File</h2>

        <div class="col-lg-8 mx-auto my-5">
            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    @foreach ($errors->all() as $error)
                        {{ $error }} <br />
                    @endforeach
                </div>
            @endif
            <form action="/upload" method="POST" enctype="multipart/form-data">
                @csrf
                <table>
                    <tbody>
                        <tr>
                            <td>
                                <b>File Gambar</b>
                            </td>
                            <td>
                                <input type="file" name="file">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Nama</b>
                            </td>
                            <td>
                                <input type="text" name="nama" value="{{ old('nama') }}">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" value="Upload" class="btn btn-primary">
            </form>
        </div>

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Gambar</th>
                    <th>Nama</th>
                    <th>Option</th>
                </tr>
            </thead>
            {{-- CARA 1 --}}
            {{-- <tbody>
                @foreach ($pictures as $p)
                    <tr>
                        <td><img width="150px" src="{{ asset('storage/' . $p) }}"></td>
                        <td>{{ $p }}</td>
                        <td>
                            <a class="btn btn-warning" href="download/{{ $p }}">Download</a>
                            <form action="delete/{{ $p }}" method="POST">
                                @csrf
                                <button class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody> --}}
            {{-- CARA 2 --}}
            <tbody>
                @foreach ($pictures as $p)
                    <tr>
                        <td>{{ $p }}</td>
                        <td>
                            <img width="150px" src="{{ asset('storage/pictures/' . $p->getFilename()) }}"
                                alt="Error">
                        </td>
                        <td>{{ $p->getFilename() }}</td>
                        <td>
                            <a class="btn btn-warning" href="download/pictures/{{ $p->getFilename() }}">Download</a>
                            <form action="delete/pictures/{{ $p->getFilename() }}" method="POST">
                                @csrf
                                <button class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</body>

</html>
