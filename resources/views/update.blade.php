@extends('app')

@section('content')

<div class="container">
    <h1>Edit File</h1>

    <!-- Display validation errors -->
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('details.update', $file->id) }}" method="POST" enctype="multipart/form-data">
        @csrf

        <!-- Input for File Name -->
        <div class="mb-3">
            <label for="filename" class="form-label">File Name</label>
            <input type="text" id="filename" name="filename" class="form-control" value="{{ $file->filename }}" required>
        </div>

        <!-- Input for File (Optional) -->
        <div class="mb-3">
            <label for="file" class="form-label">Replace File (Optional)</label>
            <input type="file" id="file" name="file" class="form-control">
            <small class="text-muted">Accepted formats: JPG, PNG, PDF, DOCX, TXT. Max size: 2MB.</small>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary">Update File</button>
        <a href="{{ route('dashboardView') }}" class="btn btn-secondary">Cancel</a>
    </form>
</div>

@endsection