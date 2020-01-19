<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function() {
	return view('dashboard/index');
});
Route::resource('cicilan', 'CicilanController');
Route::resource('customer', 'CustomerController');
Route::resource('pembelian', 'PembelianController');
Route::resource('keuangan', 'keuanganController');
Route::get('/detail/{id}', 'CicilanController@detail');
Route::get('/detail_modal/{id}', 'keuanganController@detail');
Route::resource('cicilan_detail', 'Cicilan_detailController');