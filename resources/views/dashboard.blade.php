@extends('app')

@section('content')

<div class="container mt-4">
    <h2>Dashboard</h2>
    <p>Welcome, {{ session('user')->name }}</p>
    <div class="text-end mb-3">
        <a href="{{ route('addView') }}"><button class="btn btn-primary">Add File</button></a>
    </div>
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    <!-- Display success message -->
    @if(session('success'))
    <div class="alert alert-success">
        {{ session('success') }}
    </div>
    @endif

    <div class="container mt-4">
        <div class="d-flex flex-wrap justify-content-start gap-3">
            @foreach($files as $file)
                <a href="{{ route('details.index', $file->id) }}" style="text-decoration: none; color: inherit;">
                    <div>
                        <div class="card" style="width: 18rem;">
                            <img src="{{ asset('storage/' . $file->filepath) }}" class="card-img-top" alt="this file is not jpg/jpeg/png format. click to view" style="height: 200px; object-fit: cover;">

                            <div class="card-body text-center">
                                <h5 class="card-title">{{ $file->filename }}</h5>

                                <p class="card-text">
                                    {{ $file->filetype }}<br>
                                    <small>Last Edited: {{ $file->updated_at->format('d M Y, H:i') }}</small>
                                </p>

                                @if(DB::table('shared_files')->where('id_file', $file->id)->exists())
                                    <span class="badge bg-success text-white" style="border-radius: 15px; padding: 5px 10px;">
                                        Shared
                                    </span>
                                @endif

                                <div class="d-flex justify-content-between mt-3">
                                    <form action="{{ route('file.delete', $file->id) }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </form>

                                    <a href="{{ route('details.edit', $file->id) }}" class="btn btn-primary">Edit</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            @endforeach

            {{-- @foreach($files as $file)
            <a href="{{ route('details.index', $file->id) }}" style="text-decoration: none; color: inherit;">
                <div>
                    <div class="card" style="width: 18rem;">
                        <img src="{{ asset('storage/' . $file->filepath) }}" class="card-img-top" alt="this file is not jpg/jpeg/png format. click to view" style="height: 200px; object-fit: cover;">

                        <div class="card-body text-center">
                            <h5 class="card-title">{{ $file->filename }}</h5>

                            <p class="card-text">
                                {{ $file->filetype }}<br>
                                <small>Last Edited: {{ $file->updated_at->format('d M Y, H:i') }}</small>
                            </p>

                            <span class="badge bg-success text-white" style="border-radius: 15px; padding: 5px 10px;">
                                Shared
                            </span>

                            <div class="d-flex justify-content-between mt-3">
                                <form action="{{ route('file.delete', $file->id) }}" method="POST">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>

                                <a href="" class="btn btn-primary">Edit</a>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        @endforeach --}}
        </div>
    </div>
    
</div>

@endsection
