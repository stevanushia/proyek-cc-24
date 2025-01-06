<nav class="navbar navbar-light bg-light px-4">
    <a style="text-decoration: none" href="{{ route('dashboardView') }}"><span class="navbar-brand mb-0 h1">GUGU Drive</span></a> 
    <div class="d-flex align-items-center">
        <form method="POST" action="{{ route('logout') }}" style="display: inline;">
            @csrf
            <button class="btn btn-outline-secondary me-3">Logout</button>
        </form>
        <a style="text-decoration: none" href="{{ route('profile.index') }}">
            <div 
                class="rounded-circle d-flex align-items-center justify-content-center" 
                style="width: 40px; height: 40px; background-color: #f4a261; color: white; font-size: 16px; font-weight: bold; overflow: hidden;">
                @if (session('user.profile_url'))
                    <img src="{{ asset('storage/' . session('user.profile_url')) }}" alt="Profile Picture" style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;">
                @else
                    {{ collect(explode(' ', session('user.name')))->map(fn($word) => strtoupper($word[0]))->take(2)->join('') }}
                @endif
            </div>
        </a>
        
    </div>
</nav>
