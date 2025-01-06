@extends('app')

@section('content')

<div class="container mt-4">
    <div class="card mx-auto" style="width: 40rem;">
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
        <div class="card-body text-center">
            <!-- Profile Picture or Initials -->
            <div 
                class="mx-auto mb-4 rounded-circle d-flex align-items-center justify-content-center" 
                style="width: 100px; height: 100px; background-color: #f4a261; color: white; font-size: 36px; font-weight: bold; overflow: hidden;">
                @if (session('user.profile_url'))
                    <img src="{{ asset('storage/' . session('user.profile_url')) }}" alt="Profile Picture" style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;">
                @else
                    {{ collect(explode(' ', session('user.name')))->map(fn($word) => strtoupper($word[0]))->take(2)->join('') }}
                @endif
            </div>

            <!-- User Information Form -->
            <h3 class="card-title mb-4">User Profile</h3>
            <form action="{{ route('profile.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')

                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input 
                        type="text" 
                        id="name" 
                        name="name" 
                        class="form-control" 
                        value="{{ session('user.name') }}" 
                        required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input 
                        type="email" 
                        id="email" 
                        name="email" 
                        class="form-control" 
                        value="{{ session('user.email') }}" 
                        required>
                </div>

                <div class="mb-3">
                    <label for="profile_picture" class="form-label">Profile Picture</label>
                    <input 
                        type="file" 
                        id="profile_picture" 
                        name="profile_picture" 
                        class="form-control">
                </div>

                <button type="submit" class="btn btn-primary">Update Profile</button>
            </form>
        </div>
    </div>
</div>

@endsection
