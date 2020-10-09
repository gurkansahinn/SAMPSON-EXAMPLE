# SAMPSON-EXAMPLE
SAMPSON kütüphanesi için örnek giriş sistemleri.

API

# 2. yöntemi(ana sunucuda verileri barındırmak) kullanırsam Web sunucumdan nasıl veri çekeceğim?
Sunucunuzun 80 portunu aktifleştirip erişebilecek ip adresini sadece web servisleriniz yaparsanız bunu gerçekleştirebilirsiniz. PHP ile veri çekecekseniz size örnek olarak bir kod yapısı bırakıyorum.

$account_name = "Amper";

curl_setopt($cURLConnection, CURLOPT_URL, 'https://www.lilamper.tech/samp-example/',$account_name,'.json');
curl_setopt($cURLConnection, CURLOPT_RETURNTRANSFER, true);

$accountData = curl_exec($cURLConnection);
curl_close($cURLConnection);

$jsonArrayResponse - json_decode($accountData);

# 1. yöntemi(ana sunucu içerisinden veri çekmek) Pawn'da nasıl yapacağım?
[url="https://github.com/liilamper/SAMPSON-EXAMPLE/blob/master/1.yöntem.pwn"]Tıkla ve Github üzerinden örnek kodu görüntüle[/url]
url(https://github.com/liilamper/SAMPSON-EXAMPLE/blob/master/1.yöntem.pwn)

# 2. yöntemi(başka bir sunucudan veri çekmek) Pawn'da nasıl yapacağım?
[url="https://github.com/liilamper/SAMPSON-EXAMPLE/blob/master/2.yöntem.pwn"]Tıkla ve Github üzerinden örnek kodu görüntüle[/url]
url(https://github.com/liilamper/SAMPSON-EXAMPLE/blob/master/2.yöntem.pwn)

Konuyla ilgili soru ve cevaplarınızı konu altından alabilirim. Eğer bu işleyiş biçimini kullanırken bir sistemi nasıl yapacağınız hakkında soru işaretleri kafanızda bulunuyorsa konu altından, forum özel mesajı üzerinden veya discord(harika amper#3917) üzerinden ulaşabilirsiniz.

Kullanılan kütüphane ve pluginler: SAMPSON(https://github.com/liilamper/SAMPSON)
