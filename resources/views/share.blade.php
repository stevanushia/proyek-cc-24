@extends('app')

@section('content')
<div class="container mt-4">
    <div class="card shadow-sm mx-auto" style="max-width: 500px;">
        <div class="card-body">
            <h4 class="card-title text-center mb-4">Share File</h4>

            <form action="{{ route('share.shared') }}" method="POST">
                @csrf
                <!-- Select Filename -->
                <div class="mb-3">
                    <label for="file_id" class="form-label">Filename</label>
                    <select name="file_id" id="file_id" class="form-select">
                        @foreach($files as $file)
                            <option value="{{ $file->id }}" {{ $file->id == $currentFileId ? 'selected' : '' }}>
                                {{ $file->filename }} - {{ $file->updated_at->format('M d, Y') }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <!-- Select User to Share With -->
                <div class="mb-3">
                    <label for="user_id" class="form-label">Share With</label>
                    <select name="user_id" id="user_id" class="form-select">
                        @foreach($users as $user)
                            <option value="{{ $user->id }}">{{ $user->email }}</option>
                        @endforeach
                    </select>
                </div>

                <!-- Submit Button -->
                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary">Share File</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection