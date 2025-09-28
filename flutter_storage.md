<h1>Flutter Nedir?</h1>
<p>
Flutter, Google tarafında geliştirilmiştir.Tek bir kod yapısı kullanılarak hem Android hem IOS mobil uygulamaları ayrıca web,masaüstü gibi uygulamaları geliştirilmesine olanak tanır.
</p>

<h1>Widget Mantığı Nedir?</h1>
<p>
Flutter'da her şey birer widget'tır. Widgetlar arayüzün temel bileşenleridir.Butonlar,layoutlar,textler,resimler her şey flutter yapısında bir widget olarak kabul edilir.<br>
Widgetlar iki kategoride incelenir:
</p>
<li><ol>Stateless Widget:Durum tutmayan yapılardır.Yani girdilere göre değişmezler.Örneğin bir Text widget'ı sabit bir metin gösterir.</ol></li>
<li><ol>Stateful Widget:Durum tutarlar ve bu durum değiştiğinde widget yeniden render edilir.Örneğin bir butona basıldığında sayaç artması işlemi stateful'dur.</ol></li>

<h1>Hot Reload Nedir?</h1>
<p>
Hot reload Flutter'ın en sevilen özelliklerinden biridir.Kotlin de yapılan değişiklikleri görmek için sürekli projeyi yeniden çalıştırmak gerekir.Fakat flutter'ın hot reload desteği sayesinde anında gelişmeler projede gösterilir ve buda geliştiriciyi hızlandırır.Ayrıca uygulama durumu korunur örnek olarak form ve bir adet buton içeren bir yapımız var formun içinde de veriler var biz buton rengi değiştirdiğimizde form içindeki veriler sıfırlanmaz.
</p>

<h1>SharedPreferences Nedir,Neden Kullanılır?</h1>
<p>
SharedPreferences Android yapısında cihazın depolama alanına kayıt için kullanılan yapıdır.Küçük ve basit verileri uygulama kapansa bile kalıcı olarak depolar.Anahtar-değer çiftleriyle depolanır.<br>
Örnek olarak veriler bir anahtar ('kullanici_adi') ve ona karşılık gelen bir değer ('mertBuyuknisan') şeklinde saklanır.
<br>
Basit tipler içindir genellikle string,int,bool gibi basit tipleri ve bunların liste yapılarını saklar.
</p>
<h1>SharedPreferences ve SQLite arasındaki Fark Nedir?</h1>
<p>
SQLite ve SharedPreferences ikisi de veri depolama yöntemidir ancak amacları farklıdır.<br>
<strong>SharedPreferences</strong> yapısı verileri anahtar-değer çiftleriyle tutar.Küçük verileri tutar (dark-light mode,son oturum açma zamanı vs). string,int,bool ve bunların liste yapıları gibi ilkel veri tipleriyle çalışır. 
<br>
<strong>SQLite</strong> yapısı ilişkisel bir veritabanıdır.Karmaşık yapısal veriler,büyük veri kümeleri gibi için kullanılır.Sorgulama işlemleri burada yapılır.
</p>