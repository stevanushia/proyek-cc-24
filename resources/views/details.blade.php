@extends('app')

@section('content')
    <div class="container mt-4">
        <!-- Back button and Dashboard Header -->
        <div class="d-flex align-items-center mb-3">
            <a href="{{ route('dashboardView') }}" class="btn btn-link text-decoration-none">
                <i class="bi bi-arrow-left"></i> Back
            </a>
            <h2 class="ms-3 mb-0">Dashboard</h2>
        </div>

        <!-- File Title -->
        <h4>Viewing {{ $file->filename }}</h4>

        <!-- File Preview -->
        <div class="card shadow-sm mt-4">
            <div class="card-body">
                <iframe 
                    src="{{ asset('storage/' . $file->filepath) }}" 
                    frameborder="0" 
                    style="width: 100%; height: 600px;" 
                    allowfullscreen>
                </iframe>
            </div>
        </div>

        <!-- Share Button -->
        <div class="text-end mt-3">
            <a href="{{ route('share.index', $file->id) }}" class="btn btn-primary">Share</a>
        </div>
    </div>
@endsection
