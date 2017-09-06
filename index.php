<?php
require 'vendor/autoload.php';
include 'config.php';
$app = new Slim\App(["settings" => $config]);
$container = $app->getContainer();

$container['db'] = function ($c) {
   
   try{
       $db = $c['settings']['db'];
       $options  = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
       PDO::ATTR_DEFAULT_FETCH_MODE                      => PDO::FETCH_ASSOC,
       );
       $pdo = new PDO("mysql:host=" . $db['servername'] . ";dbname=" . $db['dbname'],
       $db['username'], $db['password'],$options);
       return $pdo;
   }
   catch(\Exception $ex){
       return $ex->getMessage();
   } 
};

$app->post('/register', function ($request, $response) {
   
   try{
       $con = $this->db;
       $sql = "INSERT INTO `orangtua`(`nama_ortu`, `email`,`password`) VALUES (:nama_ortu,:email,:password)";
       $pre  = $con->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
       $values = array(
       ':nama_ortu' => $request->getParam('nama_ortu'),
       ':email' => $request->getParam('email'),
       ':password' => $request->getParam('password'),
       );
       $nama = $request->getParam('nama_ortu');
       $result = $pre->execute($values);
       $con1 = $this->db;
       $sql1 = "SELECT * FROM orangtua WHERE nama_ortu = '".$nama."'";
       $result = null;
       foreach ($con1->query($sql1) as $row) {
           $result = $row;
       }
       if($result){
           return $response->withJson(array('status' => 'Succes','results'=>$result),200);
       }else{
           return $response->withJson(array('status' => 'Users Not Found'),422);
       }
              
   }
   catch(\Exception $ex){
       return $response->withJson(array('error' => $ex->getMessage()),422);
   }
   
});

$app->post('/login', function ($request, $response) {
   
   try{
       $con = $this->db;
       $sql = "INSERT INTO `orangtua`(`email`,`password`) VALUES (:email,:password)";
       $pre  = $con->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
       $values = array(
       ':email' => $request->getParam('email'),
       ':password' => $request->getParam('password'),
       );
       $email = $request->getParam('email');
       $result = $pre->execute($values);
       $con1 = $this->db;
       $sql1 = "SELECT * FROM orangtua WHERE email = '".$email."'";
       $result = null;
       foreach ($con1->query($sql1) as $row) {
           $result = $row;
       }
       if($result){
           return $response->withJson(array('status' => 'Succes','results'=>$result),200);
       }else{
           return $response->withJson(array('status' => 'Users Not Found'),422);
       }
              
   }
   catch(\Exception $ex){
       return $response->withJson(array('error' => $ex->getMessage()),422);
   }
   
});

$app->get('/mahasiswa/{nim}', function ($request,$response){
    try{
      $nim = $request->getAttribute('nim');
      $con = $this->db;
      $sql = "SELECT `nim`, `nama_mhs`, `semester_sekarang`, `thn_msk`, `photo_url` 
      FROM `mahasiswa` WHERE `nim` = :nim";
      $pre = $con->prepare($sql,array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
      $values = array(':nim' => $nim);
      $pre->execute($values);
      $result = $pre->fetch();
      if($result){
        return $response->withJson(array('status'=>'true', 'result'=>$result),200);
      } else {
        return $response->withJson(array('status'=> 'User Not Found'),422);
      }
    }
    catch(\Exception $ex){
      return $response->withJson(array('error' => $ex->getMessage()),422);
    }
});

$app->post('/mahasiswa/tambah', function($request, $response){
  try{
    $con = $this->db;
    $sql = "INSERT INTO `mahasiswa`(`nim`) VALUES (:nim)";
    $pre = $con->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
    $values = array(
      ':nim' => $request->getParam('nim'),
      );
    $result = $pre->execute($values);
    return $response->withJson(array('status'=> 'Mahasiswa Added'),200);
  }
  catch(\Exception $ex){
    return $response->withJson(array('error'=> $ex->getMessage()),422);
  }
});

$app->get('/keluhan/{id_ortu}', function ($request, $response){
  try{
        $id_ortu = $request->getAttribute('id_ortu');
        $con = $this->db;
        $sql = "SELECT `id_keluhan`, `isi_keluhan`, `tgl_keluhan` FROM `keluhan` WHERE `id_ortu` = :id_ortu";
        $pre = $con->prepare($sql,array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        $values = array(':id_ortu' => $id_ortu);
        $pre->execute($values);
        $result = $pre->fetch();
        if($result){
          return $response->withJson(array('status'=>'true', 'result'=>$result),200);
        } else {
          return $response->withJson(array('status'=> 'Keluhan Not Found'),422);
        }
      }
      catch(\Exception $ex){
        return $response->withJson(array('error' => $ex->getMessage()),422);
      }
});

$app->post('/keluhan', function($request, $response){
  try{
    $con = $this->db;
    $sql = "INSERT INTO `keluhan`(`isi_keluhan`, `id_ortu`) VALUES (:isi_keluhan, :id_ortu)";
    $pre = $con->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
    $values = array(
      ':isi_keluhan' => $request->getParam('isi_keluhan'),
      ':id_ortu' => $request->getParam('id_ortu')
      );
    $id_ortu = $request->getParam('id_ortu');
    $result = $pre->execute($values);
    $con1 = $this->db;
    $sql1 = "SELECT * FROM keluhan WHERE id_ortu = '".$id_ortu."'";
    $result = null;
    foreach ($con1->query($sql1) as $row) {
         $result = $row;
    }
    if($result){
        return $response->withJson(array('status' => 'Succes','results'=>$result),200);
    }else{
        return $response->withJson(array('status' => 'Keluhan not Added'),422);
    }
  }

  catch(\Exception $ex){
    return $response->withJson(array('error'=> $ex->getMessage()),422);
  }
});

$app->run();