<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('files', function (Blueprint $table) {
            $table->id();
            $table->string('filename', 50);
            $table->string('filepath', 255);
            $table->string('filetype', 255);
            $table->unsignedBigInteger('owner');
            $table->date('updated_at');
            $table->date('created_at');
            $table->date('deleted_at')->nullable();

            // Foreign key constraint
            $table->foreign('owner')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('files');
    }
};
