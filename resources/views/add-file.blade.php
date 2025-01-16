@extends('app')

@section('content')

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
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
            <form action="{{ route('file.upload') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="mb-3">
                    <label for="fileName" class="form-label">File Name:</label>
                    <input type="text" class="form-control" id="fileName" name="fileName" placeholder="Enter file name" required>
                </div>
                <div class="mb-3">
                    <label for="file" class="form-label">Choose File:</label>
                    <input type="file" class="form-control" id="file" name="file">
                </div>
                <button type="submit" class="btn btn-primary">Upload</button>
            </form>
        </div>
    </div>
</div>
{{--  --}}
@endsection
