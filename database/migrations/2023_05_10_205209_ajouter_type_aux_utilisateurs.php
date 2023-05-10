<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
{
    Schema::table('Adherent_', function (Blueprint $table) {
        $table->string('type')->default('adherent');
    });
}

public function down()
{
    Schema::table('Adherent_', function (Blueprint $table) {
        $table->dropColumn('type');
    });
}

};
