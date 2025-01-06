<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DetailController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ShareController;
use App\Http\Controllers\UploadController;
use App\Http\Controllers\UploadFileController;
use Illuminate\Support\Facades\Route;

// TUTOR
Route::get('tutor', [UploadController::class, 'index']);
// Route::post('upload', [UploadController::class, 'upload']);
Route::get('download/pictures/{file}', [UploadController::class, 'download']);
// Route::post('delete/pictures/{file}', [UploadController::class, 'delete']);
// TUTOR


// LOGIN LOGIC
Route::get('/', [LoginController::class, 'index'])->name('loginView');
Route::post('login', [LoginController::class, 'login'])->name('login.submit');
// LOGIN LOGIC

// REGISTER LOGIC
Route::get('register', [LoginController::class, 'registerView'])->name('registerView');
Route::post('register', [LoginController::class, 'register'])->name('register.submit');
// REGISTER LOGIC

// DASHBOARD LOGIC
Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboardView');
// DASHBOARD LOGIC

// UPLOAD FILE LOGIC
Route::get('add-file', [UploadFileController::class, 'index'])->name('addView');
Route::post('/upload', [UploadFileController::class, 'store'])->name('file.upload');
Route::delete('/delete/{id}', [UploadFileController::class, 'softDelete'])->name('file.delete');
// UPLOAD FILE LOGIC

// PROFILE LOGIC
Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
Route::put('/profile/update', [ProfileController::class, 'update'])->name('profile.update');
// PROFILE LOGIC

// DETAILS LOGIC
Route::get('/details/{id}', [DetailController::class, 'index'])->name('details.index');
Route::get('/details/{id}/edit', [DetailController::class, 'edit'])->name('details.edit');
Route::post('/details/update/{id}', [DetailController::class, 'update'])->name('details.update');
// DETAILS LOGIC

// SHARE LOGIC
Route::get('/share/{id}', [ShareController::class, 'index'])->name('share.index');
Route::post('/share/shared', [ShareController::class, 'sharefile'])->name('share.shared');
// SHARE LOGIC



// LOGOUT LOGIC
Route::post('logout', [LoginController::class, 'logout'])->name('logout');
// LOGOUT LOGIC



