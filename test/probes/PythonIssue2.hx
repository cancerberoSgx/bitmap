package probes;
class PythonIssue2 {
  public function new(?e:Int){
    e = e==null?0:e;
    trace(e+1);
  }
  public static function main(){
    new PythonIssue2();
  }
}