# SAMPSON-EXAMPLE
SAMPSON kütüphanesi için örnek giriş sistemleri.

[b][size=5]NoSQL nedir?[/size][/b]
NoSQL veritabanları, belirli veri modelleri için özel olarak tasarlanmıştır ve modern uygulamalar oluşturmaya yönelik esnek şemalara sahiptir. NoSQL veritabanları uygun ölçekte geliştirme kolaylığı, işlevselliği ve performansıyla geniş çaplı kabul görmüştür. Belge, grafik, anahtar-değer, bellek içi ve arama dahil olmak üzere çeşitli veri modelleri kullanır. Fakat bu SA-MP üzerinde vereceğim örneklerde düşündüğümüz performansı veremez ama kesinlikle daha basit bir kullanım sağlar performans konusunda SQL kullanmaktan daha mı önde oluruz net bir şey söyleyemiyorum. Kendim şu an güncel olarak sıfırdan geliştirdiğim tüm oyun modlarını bu yönteme taşıdım. Yani bu örneklendirmeye NO-SQL diyebiliriz diye düşünüyorum.

NO-SQL için çeşitli sorgulama arayüzleri vardır. Json, REST, RPC şeklinde farklı API'lerle sorgulanabilen versiyonlar mevcut. Benim SA-MP için düşündüğüm yöntem JSON sorgulama arayüzünü kullanıyor. Peki bu nasıl çalışıyor? Şimdi iki tane yöntem ile veri çekebiliriz ana sunucu dışındaki bir sunucudan veri çekmek, ana sunucu içerisinden veri çekmek. İkinci yöntem içerisinde hesap bilgileri gibi şeyleri nasıl web arayüzüne yansıtacağım sorusunu kendinize sorduğunuzu biliyorum ve bunun cevabı çok basit.

[size=3][b]2. yöntemi(ana sunucuda verileri barındırmak) kullanırsam Web sunucumdan nasıl veri çekeceğim?[/b][/size]
Sunucunuzun 80 portunu aktifleştirip erişebilecek ip adresini sadece web servisleriniz yaparsanız bunu gerçekleştirebilirsiniz. PHP ile veri çekecekseniz size örnek olarak bir kod yapısı bırakıyorum.

[code]
$account_name = "Amper";

curl_setopt($cURLConnection, CURLOPT_URL, 'https://www.lilamper.tech/samp-example/',$account_name,'.json');
curl_setopt($cURLConnection, CURLOPT_RETURNTRANSFER, true);

$accountData = curl_exec($cURLConnection);
curl_close($cURLConnection);

$jsonArrayResponse - json_decode($accountData);
[/code]

[b][size=3]1. yöntemi(ana sunucu içerisinden veri çekmek) Pawn'da nasıl yapacağım?[/size][/b]
[url="https://github.com/liilamper/SAMPSON-EXAMPLE/blob/master/1.yöntem.pwn"]Tıkla ve Github üzerinden örnek kodu görüntüle[/url]
url(https://github.com/liilamper/SAMPSON-EXAMPLE/blob/master/1.yöntem.pwn)

[b][size=3]2. yöntemi(başka bir sunucudan veri çekmek) Pawn'da nasıl yapacağım?[/size][/b]
[url="https://github.com/liilamper/SAMPSON-EXAMPLE/blob/master/2.yöntem.pwn"]Tıkla ve Github üzerinden örnek kodu görüntüle[/url]
url(https://github.com/liilamper/SAMPSON-EXAMPLE/blob/master/2.yöntem.pwn)

Konuyla ilgili soru ve cevaplarınızı konu altından alabilirim. Eğer bu işleyiş biçimini kullanırken bir sistemi nasıl yapacağınız hakkında soru işaretleri kafanızda bulunuyorsa konu altından, forum özel mesajı üzerinden veya discord(harika amper#3917) üzerinden ulaşabilirsiniz.

Kullanılan kütüphane ve pluginler: SAMPSON(https://github.com/liilamper/SAMPSON)
