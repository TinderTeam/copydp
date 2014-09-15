<?php
function GetIP() {
    if ($_SERVER["HTTP_X_FORWARDED_FOR"])
        $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
    else if ($_SERVER["HTTP_CLIENT_IP"])
        $ip = $_SERVER["HTTP_CLIENT_IP"];
    else if ($_SERVER["REMOTE_ADDR"])
        $ip = $_SERVER["REMOTE_ADDR"];
    else if (getenv("HTTP_X_FORWARDED_FOR"))
        $ip = getenv("HTTP_X_FORWARDED_FOR");
    else if (getenv("HTTP_CLIENT_IP"))
        $ip = getenv("HTTP_CLIENT_IP");
    else if (getenv("REMOTE_ADDR"))
        $ip = getenv("REMOTE_ADDR");
    else
        $ip = "Unknown";
    return $ip;
}
?>
<?php
$ip=GetIP();
//$ip="222.23.43.23";

$url='http://www.ip138.com/ips138.asp?ip='.$ip.'&action=2';
//echo $url;
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
//����URL�����Է���curl_init������
curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/14.0.835.202 Safari/535.1");
//����UA
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//��curl_exec()��ȡ����Ϣ���ļ�������ʽ���أ�������ֱ������� ������ӣ���ʹû��echo,Ҳ���Զ����
$content = curl_exec($ch);
//ִ��
curl_close($ch);
//�ر�
//echo $content;
//<li>��վ�����ݣ�����ʡ������ ����</li>

preg_match('/��վ�����ݣ�(?<mess>(.*))��(.*)<\/li><li>/',$content,$arr);
//��ѯע������
if(strripos($arr['mess'],"ʡ")>0)
$city=substr($arr['mess'],strripos($arr['mess'],"ʡ")+2,100);
else
$city=$arr['mess'];
//echo $city;
?>

<!------------���õĳ�����������------------------->
<div><?php echo $city ?></div>