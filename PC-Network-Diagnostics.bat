@echo off
setlocal DisableDelayedExpansion
title PC Diagnostics v1.0.0
set "PC_DIAG_BATCH=%~f0"
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "$f=$env:PC_DIAG_BATCH;$lines=[IO.File]::ReadAllLines($f);$a=[Array]::IndexOf($lines,'#DIAGNOSTIC_PAYLOAD');$b=[Array]::IndexOf($lines,'#COLLECTOR_PAYLOAD');if($a -lt 0 -or $b -le $a){exit 3};$main=[scriptblock]::Create(($lines[($a+1)..($b-1)] -join [Environment]::NewLine));$collect=[scriptblock]::Create(($lines[($b+1)..($lines.Length-1)] -join [Environment]::NewLine));& $main $collect"
set "RESULT=%ERRORLEVEL%"
exit /b %RESULT%
#DIAGNOSTIC_PAYLOAD
param([scriptblock]$CollectorBlock)
$ErrorActionPreference='Continue'
$culture=[Globalization.CultureInfo]::CurrentUICulture.Name
$lang=switch -Regex ($culture) {'^pt'{'pt-BR';break} '^es'{'es';break} '^fr'{'fr';break} '^de'{'de';break} '^it'{'it';break} '^ja'{'ja';break} '^ko'{'ko';break} '^zh-(TW|HK|MO)'{'pt-BR';break} '^(zh-CN|zh-SG|zh-Hans|cmn)'{'zh-CN';break} '^ru'{'ru';break} default { 'pt-BR' } }
$L=@{
'pt-BR'=@('DIAGNÓSTICO COMPLETO DO COMPUTADOR E DA QUALIDADE DE REDE','Sessão iniciada','Idioma detectado','Sistema operacional','Placa-mãe e BIOS','Processador','Memória','Armazenamento','Placa de vídeo','Monitor','Rede ativa','IP local','Máscara de sub-rede','Gateway padrão','Endereço MAC','Adaptador','Fabricante','IP público','Velocidade do link','Teste DNS','Latência','Perda','Jitter','Estatísticas de ping','Tráfego de rede','Qualidade da conexão','Boa','Média','Ruim','Sem conexão','Não disponível','Desconhecido','Não foi possível obter alguns dados.','Coleta concluída.');
'en'=@('COMPLETE COMPUTER AND NETWORK QUALITY DIAGNOSTICS','Session started','Detected language','Operating system','Motherboard and BIOS','Processor','Memory','Storage','Graphics adapter','Monitor','Active network','Local IP','Subnet mask','Default gateway','MAC address','Adapter','Manufacturer','Public IP','Link speed','DNS test','Latency','Packet loss','Jitter','Ping statistics','Network traffic','Connection quality','Good','Fair','Poor','No connection','Not available','Unknown','Some information could not be collected.','Collection complete.');
'es'=@('DIAGNÓSTICO COMPLETO DEL ORDENADOR Y LA CALIDAD DE RED','Sesión iniciada','Idioma detectado','Sistema operativo','Placa base y BIOS','Procesador','Memoria','Almacenamiento','Adaptador gráfico','Monitor','Red activa','IP local','Máscara de subred','Puerta de enlace','Dirección MAC','Adaptador','Fabricante','IP pública','Velocidad del enlace','Prueba DNS','Latencia','Pérdida de paquetes','Jitter','Estadísticas de ping','Tráfico de interfaz','Calidad de conexión','Buena','Regular','Mala','Sin conexión','No disponible','Desconocido','No se pudieron recopilar algunos datos.','Recopilación finalizada.');
'fr'=@('DIAGNOSTIC COMPLET DE LʼORDINATEUR ET DE LA QUALITÉ DU RÉSEAU','Session démarrée','Langue détectée','Système dʼexploitation','Carte mère et BIOS','Processeur','Mémoire','Stockage','Carte graphique','Moniteur','Réseau actif','IP locale','Masque de sous-réseau','Passerelle par défaut','Adresse MAC','Adaptateur','Fabricant','IP publique','Débit de liaison','Test DNS','Latence','Perte de paquets','Gigue','Statistiques ping','Trafic de lʼinterface','Qualité de connexion','Bonne','Moyenne','Faible','Aucune connexion','Indisponible','Inconnu','Certaines données nʼont pas pu être collectées.','Collecte terminée.');
'de'=@('VOLLSTÄNDIGE COMPUTER- UND NETZWERKQUALITÄTSDIAGNOSE','Sitzung gestartet','Erkannte Sprache','Betriebssystem','Mainboard und BIOS','Prozessor','Arbeitsspeicher','Speicher','Grafikadapter','Monitor','Aktives Netzwerk','Lokale IP','Subnetzmaske','Standardgateway','MAC-Adresse','Adapter','Hersteller','Öffentliche IP','Verbindungsgeschwindigkeit','DNS-Test','Latenz','Paketverlust','Jitter','Ping-Statistik','Schnittstellenverkehr','Verbindungsqualität','Gut','Mittel','Schlecht','Keine Verbindung','Nicht verfügbar','Unbekannt','Einige Daten konnten nicht erfasst werden.','Erfassung abgeschlossen.');
'it'=@('DIAGNOSTICA COMPLETA DEL COMPUTER E DELLA QUALITÀ DELLA RETE','Sessione avviata','Lingua rilevata','Sistema operativo','Scheda madre e BIOS','Processore','Memoria','Archiviazione','Scheda grafica','Monitor','Rete attiva','IP locale','Maschera di sottorete','Gateway predefinito','Indirizzo MAC','Adattatore','Produttore','IP pubblico','Velocità collegamento','Test DNS','Latenza','Perdita pacchetti','Jitter','Statistiche ping','Traffico interfaccia','Qualità connessione','Buona','Media','Scarsa','Nessuna connessione','Non disponibile','Sconosciuto','Impossibile raccogliere alcuni dati.','Raccolta completata.');
'ja'=@('コンピューターとネットワーク品質の総合診断','セッション開始','検出された言語','オペレーティング システム','マザーボードと BIOS','プロセッサ','メモリ','ストレージ','グラフィックス アダプター','モニター','アクティブなネットワーク','ローカル IP','サブネット マスク','デフォルト ゲートウェイ','MAC アドレス','アダプター','メーカー','パブリック IP','リンク速度','DNS テスト','遅延','パケット損失','ジッター','ping 統計','インターフェイス トラフィック','接続品質','良好','普通','不良','接続なし','利用不可','不明','一部の情報を収集できませんでした。','収集が完了しました。');
'ko'=@('컴퓨터 및 네트워크 품질 전체 진단','세션 시작','감지된 언어','운영 체제','메인보드 및 BIOS','프로세서','메모리','저장 장치','그래픽 어댑터','모니터','활성 네트워크','로컬 IP','서브넷 마스크','기본 게이트웨이','MAC 주소','어댑터','제조업체','공인 IP','링크 속도','DNS 테스트','지연 시간','패킷 손실','지터','핑 통계','인터페이스 트래픽','연결 품질','양호','보통','불량','연결 안 됨','사용 불가','알 수 없음','일부 정보를 수집하지 못했습니다.','수집이 완료되었습니다.');
'zh-CN'=@('电脑与网络质量完整诊断','会话开始时间','检测到的语言','操作系统','主板与 BIOS','处理器','内存','存储设备','显卡','显示器','活动网络','本地 IP','子网掩码','默认网关','MAC 地址','适配器','制造商','公网 IP','链路速度','DNS 测试','延迟','丢包','抖动','Ping 统计','网卡流量','连接质量','良好','一般','较差','无连接','不可用','未知','部分信息无法采集。','采集完成。');
'ru'=@('ПОЛНАЯ ДИАГНОСТИКА КОМПЬЮТЕРА И КАЧЕСТВА СЕТИ','Сеанс начат','Обнаруженный язык','Операционная система','Материнская плата и BIOS','Процессор','Память','Накопитель','Видеокарта','Монитор','Активная сеть','Локальный IP','Маска подсети','Основной шлюз','MAC-адрес','Адаптер','Производитель','Публичный IP','Скорость соединения','Проверка DNS','Задержка','Потеря пакетов','Джиттер','Статистика ping','Трафик интерфейса','Качество соединения','Хорошее','Среднее','Плохое','Нет соединения','Недоступно','Неизвестно','Не удалось собрать часть данных.','Сбор завершён.')
}
$T=$L[$lang]
try { $windowTitle = [regex]::Replace($T[0].ToLowerInvariant(), '\b\p{L}', { param($m) $m.Value.ToUpperInvariant() }); $Host.UI.RawUI.WindowTitle = $windowTitle + ' v1.0.0' } catch { }
$X=@{
 'pt-BR'=@('Versão','Tempo ligado','Versão do BIOS','Frequência / núcleos / threads','Pressione Enter para fechar.')
 'en'=@('Version','Uptime','BIOS version','Frequency / cores / threads','Press Enter to close.')
 'es'=@('Versión','Tiempo de actividad','Versión del BIOS','Frecuencia / núcleos / hilos','Pulse Enter para cerrar.')
 'fr'=@('Version','Temps de fonctionnement','Version du BIOS','Fréquence / cœurs / threads','Appuyez sur Entrée pour fermer.')
 'de'=@('Version','Laufzeit','BIOS-Version','Takt / Kerne / Threads','Zum Schließen die Eingabetaste drücken.')
 'it'=@('Versione','Tempo di attività','Versione BIOS','Frequenza / core / thread','Premi Invio per chiudere.')
 'ja'=@('バージョン','稼働時間','BIOS バージョン','周波数 / コア / スレッド','Enter キーを押して閉じます。')
 'ko'=@('버전','가동 시간','BIOS 버전','주파수 / 코어 / 스레드','Enter 키를 눌러 닫으세요.')
 'zh-CN'=@('版本','运行时间','BIOS 版本','频率 / 核心 / 线程','按 Enter 关闭。')
 'ru'=@('Версия','Время работы','Версия BIOS','Частота / ядра / потоки','Нажмите Enter, чтобы закрыть.')
}
$X=$X[$lang]
$R=@{
'pt-BR'=@('Data','Hora','Computador','Usuário','Tipo de conexão','Tempo de resposta','Pacotes enviados','Erros da interface (recebidos/envios)','Vídeo integrado','Outros vídeos','núcleos','threads','Recebido','Enviado')
 en=@('Date','Time','Computer','User','Connection type','Response time','Packets sent','Interface errors (received/sent)','Integrated graphics','Other display adapters','cores','threads','Received','Sent')
 es=@('Fecha','Hora','Equipo','Usuario','Tipo de conexión','Tiempo de respuesta','Paquetes enviados','Errores de interfaz (recibidos/enviados)','Gráficos integrados','Otros adaptadores de vídeo','núcleos','hilos','Recibido','Enviado')
 fr=@('Date','Heure','Ordinateur','Utilisateur','Type de connexion','Temps de réponse','Paquets envoyés','Erreurs dʼinterface (reçus/envoyés)','Graphiques intégrés','Autres adaptateurs vidéo','cœurs','threads','Reçu','Envoyé')
 de=@('Datum','Uhrzeit','Computer','Benutzer','Verbindungstyp','Antwortzeit','Gesendete Pakete','Schnittstellenfehler (empfangen/gesendet)','Integrierte Grafik','Weitere Grafikadapter','Kerne','Threads','Empfangen','Gesendet')
 it=@('Data','Ora','Computer','Utente','Tipo di connessione','Tempo di risposta','Pacchetti inviati','Errori interfaccia (ricevuti/inviati)','Grafica integrata','Altri adattatori video','core','thread','Ricevuti','Inviati')
 ja=@('日付','時刻','コンピューター','ユーザー','接続の種類','応答時間','送信パケット','インターフェイス エラー (受信/送信)','内蔵グラフィックス','その他のディスプレイ アダプター','コア','スレッド','受信','送信')
 ko=@('날짜','시간','컴퓨터','사용자','연결 유형','응답 시간','전송 패킷','인터페이스 오류 (수신/전송)','내장 그래픽','기타 디스플레이 어댑터','코어','스레드','수신','전송')
 'zh-CN'=@('日期','时间','计算机','用户','连接类型','响应时间','已发送数据包','网卡错误（接收/发送）','集成显卡','其他显示适配器','核心','线程','接收','发送')
 ru=@('Дата','Время','Компьютер','Пользователь','Тип подключения','Время ответа','Отправлено пакетов','Ошибки интерфейса (приём/отправка)','Встроенная графика','Другие видеоадаптеры','ядер','потоков','Получено','Отправлено')
}[$lang]
$H=@{
'pt-BR'=@('Sistema e Hardware','Informações do Adaptador de Rede, IP, Gateway, Máscara e MAC','Tipo de Conexão','Teste de Resolução DNS (cloudflare.com)','Teste de Latência (ping 1.1.1.1)','Teste de Latência (ping 8.8.8.8)','Tráfego de Rede (Tx/Rx - bytes enviados/recebidos)','Qualidade da conexão')
'en'=@('System and Hardware','Network Adapter, IP, Gateway, Subnet Mask, and MAC Information','Connection Type','DNS Resolution Test (cloudflare.com)','Latency Test (ping 1.1.1.1)','Latency Test (ping 8.8.8.8)','Network Traffic (Tx/Rx - bytes sent/received)','Connection Quality')
'es'=@('Sistema y hardware','Información del adaptador de red, IP, puerta de enlace, máscara y MAC','Tipo de conexión','Prueba de resolución DNS (cloudflare.com)','Prueba de latencia (ping 1.1.1.1)','Prueba de latencia (ping 8.8.8.8)','Tráfico de red (Tx/Rx - bytes enviados/recibidos)','Calidad de conexión')
'fr'=@('Système et matériel','Informations sur l''adaptateur réseau, IP, passerelle, masque et MAC','Type de connexion','Test de résolution DNS (cloudflare.com)','Test de latence (ping 1.1.1.1)','Test de latence (ping 8.8.8.8)','Trafic réseau (Tx/Rx - octets envoyés/reçus)','Qualité de la connexion')
'de'=@('System und Hardware','Netzwerkadapter-, IP-, Gateway-, Subnetzmasken- und MAC-Informationen','Verbindungstyp','DNS-Auflösungstest (cloudflare.com)','Latenztest (ping 1.1.1.1)','Latenztest (ping 8.8.8.8)','Netzwerkverkehr (Tx/Rx - gesendete/empfangene Bytes)','Verbindungsqualität')
'it'=@('Sistema e hardware','Informazioni su scheda di rete, IP, gateway, maschera e MAC','Tipo di connessione','Test di risoluzione DNS (cloudflare.com)','Test di latenza (ping 1.1.1.1)','Test di latenza (ping 8.8.8.8)','Traffico di rete (Tx/Rx - byte inviati/ricevuti)','Qualità della connessione')
'ja'=@('システムとハードウェア','ネットワーク アダプター、IP、ゲートウェイ、サブネット マスク、MAC 情報','接続の種類','DNS 名前解決テスト (cloudflare.com)','遅延テスト (ping 1.1.1.1)','遅延テスト (ping 8.8.8.8)','ネットワーク トラフィック (送受信バイト)','接続品質')
'ko'=@('시스템 및 하드웨어','네트워크 어댑터, IP, 게이트웨이, 서브넷 마스크 및 MAC 정보','연결 유형','DNS 확인 테스트 (cloudflare.com)','지연 시간 테스트 (ping 1.1.1.1)','지연 시간 테스트 (ping 8.8.8.8)','네트워크 트래픽 (송수신 바이트)','연결 품질')
'zh-CN'=@('系统与硬件','网络适配器、IP、网关、子网掩码和 MAC 信息','连接类型','DNS 解析测试 (cloudflare.com)','延迟测试 (ping 1.1.1.1)','延迟测试 (ping 8.8.8.8)','网络流量（发送/接收字节）','连接质量')
'ru'=@('Система и оборудование','Сведения о сетевом адаптере, IP, шлюзе, маске и MAC','Тип подключения','Проверка DNS (cloudflare.com)','Проверка задержки (ping 1.1.1.1)','Проверка задержки (ping 8.8.8.8)','Сетевой трафик (отправлено/получено байт)','Качество соединения')
}[$lang]
$utf8NoBom = New-Object System.Text.UTF8Encoding -ArgumentList $false
[Console]::OutputEncoding = $utf8NoBom
$started=Get-Date
$rule='='*78
$titleIndent=[Math]::Max(0,[int](($rule.Length-$T[0].Length)/2))
Write-Host $rule -ForegroundColor DarkCyan
Write-Host ((' '*$titleIndent)+$T[0]) -ForegroundColor Cyan
Write-Host $rule -ForegroundColor DarkCyan
Write-Host ('•{0}: {1:dd/MM/yyyy}  /  •{2}: {1:HH:mm}' -f $R[0],$started,$R[1]) -ForegroundColor Gray
Write-Host ('{0}: 1.0.0  |  {1}: {2}' -f $X[0],$T[1],$started.ToString('HH:mm:ss')) -ForegroundColor Gray
Write-Host ('{0}: {1} ({2})' -f $T[2],$lang,$culture) -ForegroundColor Gray
Write-Host $rule -ForegroundColor DarkGray
$data=Join-Path ([IO.Path]::GetTempPath()) ('pcdiag-'+[Guid]::NewGuid().ToString('N')+'.txt');$partial=$false
try { & $CollectorBlock -OutPath $data;if(-not(Test-Path -LiteralPath $data)){throw 'collector returned no data'};$info=@{};foreach($line in [IO.File]::ReadAllLines($data,[Text.Encoding]::UTF8)){$ix=$line.IndexOf('=');if($ix -gt 0){$info[$line.Substring(0,$ix)]=$line.Substring($ix+1)}}}catch{$info=@{};$partial=$true}
function Val([string]$Key){$v=$info[$Key];if($null -eq $v -or ([string]$v).Trim().Length -eq 0 -or $v -eq 'Desconhecido' -or $v -eq 'N/D'){return $T[31]};return [string]$v}
function Row([string]$Label,[string]$Value){
    $dots=[Math]::Max(1,22-$Label.Length)
    $prefix=('•{0}{1}: ' -f $Label,('.' * $dots))
    $width=82
    try{$width=[Math]::Max(54,[Math]::Min(118,$Host.UI.RawUI.WindowSize.Width))}catch{}
    $available=[Math]::Max(24,$width-$prefix.Length-1)
    $remaining=[string]$Value
    $first=$true
    while($remaining.Length -gt $available){
        $cut=$remaining.LastIndexOf(' ',$available)
        if($cut -lt 1){$cut=$available}
        $part=$remaining.Substring(0,$cut)
        if($first){Write-Host $prefix -NoNewline -ForegroundColor Gray;$first=$false}else{Write-Host (' ' * $prefix.Length) -NoNewline}
        Write-Host $part -ForegroundColor White
        $remaining=$remaining.Substring($cut).TrimStart()
    }
    if($first){Write-Host $prefix -NoNewline -ForegroundColor Gray}else{Write-Host (' ' * $prefix.Length) -NoNewline}
    Write-Host $remaining -ForegroundColor White
}
function Section([int]$Number,[string]$Title){Write-Host '';Write-Host ('[{0}] {1}:' -f $Number,$Title) -ForegroundColor Cyan}
Section 1 $H[0]
Row $T[3] ((Val 'SO_CAPTION')+' ['+(Val 'SO_VERSAO')+'] | '+(Val 'SO_ARQ')+' | '+$X[1]+': '+(Val 'SO_UPTIME'))
Row $R[2] $env:COMPUTERNAME
Row $R[3] $env:USERNAME
Row $T[9] (Val 'MON_LINHA')
Row $T[4] ((Val 'MB_MODELO')+' | '+$T[16]+': '+(Val 'MB_FAB')+' | '+$X[2]+': '+(Val 'BIOS_VER'))
Row $T[5] ((Val 'CPU_NOME')+' | '+(Val 'CPU_FREQ')+' | '+(Val 'CPU_NUCLEOS')+' '+$R[10]+' / '+(Val 'CPU_THREADS')+' '+$R[11])
Row $T[8] (Val 'GPU_DEDICADA_LINHA')
if((Val 'GPU_INTEGRADA_LINHA') -ne $T[31]){Row $R[8] (Val 'GPU_INTEGRADA_LINHA')}
if((Val 'GPU_OUTRAS') -ne $T[31]){Row $R[9] (Val 'GPU_OUTRAS')}
Row $T[6] (Val 'RAM_LINHA')
Row $T[7] ((Val 'STOR_MODELO')+' | '+(Val 'STOR_TIPO')+' ('+(Val 'STOR_BUS')+') | '+(Val 'STOR_GB')+' GB')
Write-Host ('-'*72) -ForegroundColor DarkGray
Section 2 $H[1]
Row $T[11] (Val 'IP_V4');Row $T[12] (Val 'MÁSCARA');Row $T[13] (Val 'GATEWAY_PADRAO');Row $T[14] (Val 'MAC_ADDR');Row $T[16] (Val 'ADAPTADOR_FAB');Row $T[15] (Val 'ADAPTADOR_NOME');Row $T[17] (Val 'IP_PUBLICO')
Write-Host ('-'*72) -ForegroundColor DarkGray
Section 3 $H[2]
$connectionType=if((Val 'ADAPTADOR_NOME') -match '(?i)wi-?fi|wireless|wlan'){ 'Wi-Fi' }else{ 'Ethernet' }
Row $R[4] $connectionType
Row $T[18] (Val 'NET_SPEED_TXT')
Write-Host ('-'*72) -ForegroundColor DarkGray
Section 4 $H[3]
Row $R[5] ((Val 'DNS_MS')+' ms | '+(Val 'DNS_STATUS'))
Write-Host ('-'*72) -ForegroundColor DarkGray
Section 5 $H[4]
foreach($prefix in @(@('1.1.1.1','PING1'),@('8.8.8.8','PING2'))){
    $p=$prefix[1]
    if($p -eq 'PING2'){Write-Host ('-'*72) -ForegroundColor DarkGray;Section 6 $H[5]}
    $samples=(Val ($p+'_TEMPOS')) -split ','
    for($sampleIndex=0;$sampleIndex -lt 4;$sampleIndex++){$sample='--';if($sampleIndex -lt $samples.Count -and $samples[$sampleIndex]){$sample=$samples[$sampleIndex]+' ms'};Row ($R[5]+' '+($sampleIndex+1)) $sample}
    Row $R[6] '4'
    Row $T[21] ((Val ($p+'_PERDA'))+'%')
    Row ($T[20]+' (min/avg/max)') ((Val ($p+'_MIN'))+' / '+(Val ($p+'_AVG'))+' / '+(Val ($p+'_MAX'))+' ms')
    Row $T[22] ((Val ($p+'_JITTER'))+' ms')
}
Write-Host ('-'*72) -ForegroundColor DarkGray
Section 7 $H[6]
try {
    $traffic = Get-WmiObject -Class Win32_PerfFormattedData_Tcpip_NetworkInterface -ErrorAction Stop |
        Where-Object { $_.Name -notmatch 'Loopback|Teredo|isatap' } |
        Sort-Object { [double]$_.BytesReceivedPersec + [double]$_.BytesSentPersec } -Descending |
        Select-Object -First 1
    if ($traffic) {
        $trafficValue = '{0}: {1:N0} B/s | {2}: {3:N0} B/s' -f $R[12],[double]$traffic.BytesReceivedPersec,$R[13],[double]$traffic.BytesSentPersec
        Row $T[24] $trafficValue
    } else { Row $T[24] $T[30] }
} catch { Row $T[24] $T[30] }
Section 8 $H[7];$avg=[double]0;$loss=[double]100;[void][double]::TryParse([string]$info.PING2_AVG,[ref]$avg);[void][double]::TryParse([string]$info.PING2_PERDA,[ref]$loss);if($loss -ge 100){$quality=$T[29]}elseif($avg -lt 80){$quality=$T[26]}elseif($avg -lt 150){$quality=$T[27]}else{$quality=$T[28]};Row $T[25] $quality;Row $T[26] '< 80 ms';Row $T[27] '80–149 ms';Row $T[28] '≥ 150 ms'
if($partial){Write-Host $T[32] -ForegroundColor DarkYellow};Write-Host ('='*72) -ForegroundColor DarkCyan;Write-Host $T[33] -ForegroundColor Green;if($data -and (Test-Path $data)){Remove-Item -LiteralPath $data -Force -ErrorAction SilentlyContinue};Read-Host $X[4]|Out-Null
#COLLECTOR_PAYLOAD
param([string]$OutPath)

$ErrorActionPreference = 'SilentlyContinue'
$UseWmi = -not (Get-Command Get-CimInstance -ErrorAction SilentlyContinue)

function Get-Info {
    param([string]$Class)
    if (Get-Command Get-CimInstance -ErrorAction SilentlyContinue) {
        try {
            $result = @(Get-CimInstance -ClassName $Class -ErrorAction Stop)
            if ($result.Count -gt 0) { return $result }
        } catch { }
    }
    try { return @(Get-WmiObject -Class $Class -ErrorAction Stop) }
    catch { return @() }
}
# Constroi texto acentuado a partir de codigos numericos, para não depender
# de como o PowerShell decide interpretar a codificação deste arquivo.
function Txt {
    param([string]$s)
    $s = $s -replace '\{a\}', [char]0x00E3
    $s = $s -replace '\{A\}', [char]0x00C3
    $s = $s -replace '\{c\}', [char]0x00E7
    $s = $s -replace '\{e\}', [char]0x00E9
    $s = $s -replace '\{ea\}', [char]0x00EA
    $s = $s -replace '\{i\}', [char]0x00ED
    $s = $s -replace '\{o\}', [char]0x00F3
    $s = $s -replace '\{u\}', [char]0x00FA
    return $s
}

# Filtra valores "placeholder" que o WMI/BIOS às vezes retorna quando não
# tem a informação real (isso é o que causava "Unknown" aparecer no
# relatório ao invés de "Desconhecido" - o valor cru passava direto).
$valoresInvalidos = @('unknown','undefined','to be filled by o.e.m.','system manufacturer',
    'system product name','manufacturer00','n/a','none','default string','0','00','0000',
    'not specified','not available','no enclosure','o.e.m.')
function Get-ValorLimpo {
    param([string]$v)
    if (-not $v) { return '' }
    $v2 = $v.Trim()
    if (-not $v2) { return '' }
    if ($valoresInvalidos -contains $v2.ToLower()) { return '' }
    return $v2
}

# Normaliza nomes de fabricante verbosos para a forma curta mais comum
# (deixa o relatório mais limpo, ex: "ASUSTeK COMPUTER INC." -> "ASUS")
$mapaNormalizacaoFab = @{
    'asustek computer inc.'='ASUS'; 'asustek computer inc'='ASUS';
    'micro-star international co., ltd.'='MSI'; 'micro-star international co.,ltd.'='MSI';
    'gigabyte technology co., ltd.'='Gigabyte'; 'giga-byte technology co., ltd.'='Gigabyte';
    'asrock incorporation'='ASRock'; 'asrock inc.'='ASRock';
    'dell inc.'='Dell'; 'hewlett-packard'='HP'; 'hp inc.'='HP';
    'lenovo'='Lenovo'; 'acer inc.'='Acer'
}
function Get-FabricanteCurto {
    param([string]$v)
    if (-not $v) { return $v }
    $key = $v.Trim().ToLower()
    if ($mapaNormalizacaoFab.ContainsKey($key)) { return $mapaNormalizacaoFab[$key] }
    return $v.Trim()
}

# ---------- Sistema Operacional ----------
$os = Get-Info 'Win32_OperatingSystem' | Select-Object -First 1
$SO_CAPTION = 'Desconhecido'
$SO_VERSAO = 'Desconhecido'
$SO_ARQ = '?'
$bootTime = $null
if ($os) {
    $SO_CAPTION = ($os.Caption -replace 'Microsoft ', '').Trim()
    $SO_VERSAO = $os.Version
    if ($os.OSArchitecture) { $SO_ARQ = $os.OSArchitecture }
    if ($UseWmi) {
        try { $bootTime = $os.ConvertToDateTime($os.LastBootUpTime) } catch {}
    } else {
        $bootTime = $os.LastBootUpTime
    }
}
$SO_UPTIME = 'Desconhecido'
if ($bootTime) {
    $up = (Get-Date) - $bootTime
    $SO_UPTIME = [string]$up.Days + 'd ' + [string]$up.Hours + 'h ' + [string]$up.Minutes + 'min'
}

# ---------- Placa-mãe e BIOS ----------
$bb = Get-Info 'Win32_BaseBoard' | Select-Object -First 1
$biosInfo = Get-Info 'Win32_BIOS' | Select-Object -First 1
$MB_FAB = 'Desconhecido'
$MB_MODELO = 'Desconhecido'
$BIOS_VER = 'Desconhecido'
if ($bb) {
    $MB_FAB = Get-FabricanteCurto (Get-ValorLimpo $bb.Manufacturer)
    $MB_MODELO = Get-ValorLimpo $bb.Product
    if (-not $MB_FAB) { $MB_FAB = 'Desconhecido' }
    if (-not $MB_MODELO) { $MB_MODELO = 'Desconhecido' }
}
if ($biosInfo) { $BIOS_VER = $biosInfo.SMBIOSBIOSVersion }

# ---------- Processador ----------
$cpuInfo = Get-Info 'Win32_Processor' | Select-Object -First 1
$CPU_NOME = 'Desconhecido'
$CPU_FREQ = ''
$CPU_NUCLEOS = '?'
$CPU_THREADS = '?'
if ($cpuInfo) {
    $nomeCru = $cpuInfo.Name
    if ($nomeCru) {
        $nomeLimpo = $nomeCru -replace '\(R\)', '' -replace '\(TM\)', '' -replace '\(C\)', '' -replace '\s*CPU\s*@.*$', ''
        $nomeLimpo = ($nomeLimpo -replace '\s{2,}', ' ').Trim()
        if ($nomeLimpo) { $CPU_NOME = $nomeLimpo } else { $CPU_NOME = $nomeCru }
    }
    if ($cpuInfo.MaxClockSpeed) {
        $CPU_FREQ = [string]([math]::Round($cpuInfo.MaxClockSpeed / 1000, 2)) + 'GHz'
    }
    if ($cpuInfo.NumberOfCores) { $CPU_NUCLEOS = $cpuInfo.NumberOfCores }
    if ($cpuInfo.NumberOfLogicalProcessors) { $CPU_THREADS = $cpuInfo.NumberOfLogicalProcessors }
}

# ---------- Memória RAM ----------
$csInfo = Get-Info 'Win32_ComputerSystem' | Select-Object -First 1
$RAM_GB = 0
if ($csInfo) { $RAM_GB = [math]::Round($csInfo.TotalPhysicalMemory / 1GB, 2) }

$memModules = Get-Info 'Win32_PhysicalMemory'
$RAM_TIPO = 'Desconhecido'
$RAM_FREQ = 'Desconhecido'
$RAM_FAB = ''
$RAM_MODELO = ''
$RAM_MODULOS_TXT = ''
if ($memModules) {
    $listaMem = @($memModules)
    $primeiro = $listaMem | Select-Object -First 1
    $ddrCode = $primeiro.SMBIOSMemoryType
    $ddrMap = @{20='DDR';21='DDR2';22='DDR2 FB-DIMM';24='DDR3';26='DDR4';27='LPDDR4';28='DDR5';34='DDR5';35='LPDDR5'}
    if ($ddrCode -and $ddrMap.ContainsKey([int]$ddrCode)) { $RAM_TIPO = $ddrMap[[int]$ddrCode] }
    $freq = $listaMem | Select-Object -ExpandProperty Speed | Sort-Object -Descending | Select-Object -First 1
    if ($freq) { $RAM_FREQ = $freq }

    # Busca fabricante/modelo no PRIMEIRO módulo que realmente tiver essa
    # informação preenchida - alguns sistemas relatam SPD inconsistente
    # entre slots (um pente pode não informar, outro sim), então olhar só
    # o indice 0 pode perder informação que estava disponível em outro slot.
    foreach ($m in $listaMem) {
        if (-not $RAM_FAB) {
            $cand = Get-ValorLimpo $m.Manufacturer
            if ($cand) { $RAM_FAB = Get-FabricanteCurto $cand }
        }
        if (-not $RAM_MODELO) {
            $cand2 = Get-ValorLimpo $m.PartNumber
            if ($cand2) { $RAM_MODELO = $cand2 }
        }
    }

    $qtdModulos = $listaMem.Count
    if ($qtdModulos -gt 1) {
        $tamanhos = $listaMem | ForEach-Object { $_.Capacity } | Where-Object { $_ }
        $tamanhosUnicos = $tamanhos | Select-Object -Unique
        if ($tamanhos -and $tamanhosUnicos.Count -eq 1) {
            $tamUnico = [math]::Round($tamanhosUnicos[0] / 1GB, 0)
            $RAM_MODULOS_TXT = ' (' + [string]$qtdModulos + 'x' + [string]$tamUnico + ' GB)'
        } else {
            $RAM_MODULOS_TXT = ' (' + [string]$qtdModulos + (Txt ' m{o}dulos)')
        }
    }
}
$RAM_NOME = ''
if ($RAM_FAB -or $RAM_MODELO) {
    $partesRam = @()
    if ($RAM_FAB) { $partesRam += $RAM_FAB }
    if ($RAM_MODELO) { $partesRam += $RAM_MODELO }
    $RAM_NOME = ($partesRam -join ' ')
}
if (-not $RAM_FAB) { $RAM_FAB = 'Desconhecido' }

if ($RAM_NOME) {
    $RAM_LINHA = $RAM_NOME + ' | FABRICANTE: ' + $RAM_FAB + ' | ' + [string]$RAM_GB + ' GB' + $RAM_MODULOS_TXT + ' | ' + $RAM_TIPO + ' | ' + [string]$RAM_FREQ + ' MHz'
} else {
    $RAM_LINHA = [string]$RAM_GB + ' GB' + $RAM_MODULOS_TXT + ' | ' + $RAM_TIPO + ' | ' + [string]$RAM_FREQ + ' MHz'
}

# ---------- Armazenamento (disco do sistema - unidade C:) ----------
$STOR_MODELO = 'Desconhecido'
$STOR_TIPO = 'Desconhecido'
$STOR_BUS = ''
$STOR_GB = 0
$storageOk = $false
try {
    $systemDrive = if ($env:SystemDrive) { $env:SystemDrive.TrimEnd(':') } else { 'C' }
    $part = Get-Partition -DriveLetter $systemDrive -ErrorAction Stop
    $disk = $part | Get-Disk -ErrorAction Stop
    $STOR_MODELO = $disk.FriendlyName
    $physList = Get-PhysicalDisk -ErrorAction Stop
    $phys = $physList | Where-Object { [string]$_.DeviceId -eq [string]$disk.Number }
    if ($phys) {
        $STOR_TIPO = ($phys | Select-Object -First 1 -ExpandProperty MediaType)
        $busVal = ($phys | Select-Object -First 1 -ExpandProperty BusType)
        if ($busVal) { $STOR_BUS = [string]$busVal }
        $somaTam = ($phys | Measure-Object Size -Sum).Sum
        if ($somaTam -and $somaTam -gt 0) { $STOR_GB = [math]::Round($somaTam / 1GB, 2) }
        else { $STOR_GB = [math]::Round($disk.Size / 1GB, 2) }
    } else {
        $STOR_GB = [math]::Round($disk.Size / 1GB, 2)
    }
    $storageOk = $true
} catch { $storageOk = $false }

if (-not $storageOk) {
    $systemDrive = if ($env:SystemDrive) { $env:SystemDrive } else { 'C:' }
    $diskIndexes = @()
    $driveLinks = Get-Info 'Win32_LogicalDiskToPartition' | Where-Object {
        $_.Dependent -match ('DeviceID="' + [regex]::Escape($systemDrive) + '"')
    }
    foreach ($link in $driveLinks) {
        if ([string]$link.Antecedent -match 'Disk #([0-9]+), Partition #') {
            $diskIndexes += [int]$Matches[1]
        }
    }
    $dd = Get-Info 'Win32_DiskDrive' | Where-Object { $diskIndexes -contains [int]$_.Index } | Select-Object -First 1
    if ($dd) {
        $STOR_MODELO = $dd.Model
        $STOR_GB = [math]::Round($dd.Size / 1GB, 2)
        $STOR_TIPO = Txt 'N{a}o identificado (modo compatibilidade)'
    }
}

# ---------- Placa(s) de Video + VRAM real via Registro ----------
$vramMap = @{}
$driverVerMap = @{}
$biosVerMap = @{}
$guid = '{4d36e968-e325-11ce-bfc1-08002be10318}'
$regBase = 'HKLM:\SYSTEM\CurrentControlSet\Control\Class\' + $guid
$regKeys = Get-ChildItem -Path $regBase -ErrorAction SilentlyContinue
if ($regKeys) {
    foreach ($k in $regKeys) {
        if ($k.PSChildName -match '^[0-9]{4}$') {
            $desc = (Get-ItemProperty -Path $k.PSPath -Name 'DriverDesc' -ErrorAction SilentlyContinue).DriverDesc
            if ($desc) {
                $qw = (Get-ItemProperty -Path $k.PSPath -Name 'HardwareInformation.qwMemorySize' -ErrorAction SilentlyContinue).'HardwareInformation.qwMemorySize'
                if ($qw -and [double]$qw -gt 0) {
                    $vramMap[$desc] = [math]::Round([double]$qw / 1GB, 2)
                }
                $dv = (Get-ItemProperty -Path $k.PSPath -Name 'DriverVersion' -ErrorAction SilentlyContinue).DriverVersion
                if ($dv) { $driverVerMap[$desc] = $dv }
                # Best-effort: alguns drivers preenchem esta chave com a
                # versão da VBIOS, mas isso NÃO é padronizado pelo Windows
                # (diferente da BIOS da placa-mãe, que tem Win32_BIOS) -
                # então na maioria dos sistemas isso vai ficar vazio mesmo,
                # e cai no fallback "Desconhecido" mais abaixo.
                $bv = (Get-ItemProperty -Path $k.PSPath -Name 'HardwareInformation.BiosString' -ErrorAction SilentlyContinue).'HardwareInformation.BiosString'
                if ($bv) { $biosVerMap[$desc] = $bv }
            }
        }
    }
}

# Traduz o formato interno do Windows (WDDM) para a versão comercial da NVIDIA.
function Convert-NvidiaDriverVersion {
    param([string]$raw)
    if (-not $raw) { return $raw }
    $digits = ($raw -replace '[^0-9]', '')
    if ($digits.Length -ge 5) {
        $last5 = $digits.Substring($digits.Length - 5)
        return $last5.Substring(0,3) + '.' + $last5.Substring(3,2)
    }
    return $raw
}

# Fabricante fisico da placa (best-effort) via ID do fornecedor do
# subsistema PCI (SUBSYS), presente no PNPDeviceID. Só preenche quando
# reconhece um ID conhecido - informação errada e pior que nenhuma.
$mapaFabricantesGPU = @{
    '1043'='ASUS'; '1458'='Gigabyte'; '1462'='MSI'; '196E'='PNY'; '19DA'='Zotac';
    '3842'='EVGA'; '174B'='PC Partner/Sapphire'; '1DA2'='Sapphire'; '148C'='PowerColor';
    '1682'='XFX'; '1569'='Palit'; '3D3D'='Palit'; '7377'='Colorful'; '1092'='ASUS';
    '10DE'='NVIDIA (Founders Edition)'
}
function Get-GpuFabricante {
    param([string]$pnpId)
    if (-not $pnpId) { return '' }
    if ($pnpId -match 'SUBSYS_[0-9A-Fa-f]{4}([0-9A-Fa-f]{4})') {
        $vid = $matches[1].ToUpper()
        if ($mapaFabricantesGPU.ContainsKey($vid)) { return $mapaFabricantesGPU[$vid] }
    }
    return ''
}

$controllers = Get-Info 'Win32_VideoController'
if (-not $controllers) {
    # Segunda tentativa - uma consulta WMI pode falhar de forma pontual
    # (servico ainda inicializando, etc.); vale a pena tentar de novo antes
    # de assumir que realmente não há GPU.
    Start-Sleep -Milliseconds 400
    $controllers = Get-Info 'Win32_VideoController'
}
$totalGPU = 0

$GPU_DEDICADA_NOME = ''
$GPU_DEDICADA_FAB = ''
$GPU_DEDICADA_VRAM = ''
$GPU_DEDICADA_DRIVER = ''
$GPU_DEDICADA_BIOS = ''
$GPU_INTEGRADA_NOME = ''
$GPU_INTEGRADA_FAB = ''
$GPU_INTEGRADA_DRIVER = ''
$outras = @()

if ($controllers) {
    foreach ($c in $controllers) {
        $nome = $c.Name
        if (-not $nome) { continue }
        $totalGPU++
        $vramTxt = 'N/D'
        if ($vramMap.ContainsKey($nome)) {
            $vramTxt = [string]$vramMap[$nome] + ' GB'
        } elseif ($c.AdapterRAM -and [double]$c.AdapterRAM -gt 0) {
            $vramTxt = [string]([math]::Round([double]$c.AdapterRAM / 1GB, 2)) + ' GB (aprox)'
        }
        $drvRaw = ''
        if ($driverVerMap.ContainsKey($nome)) { $drvRaw = $driverVerMap[$nome] }
        elseif ($c.DriverVersion) { $drvRaw = $c.DriverVersion }

        $ehNvidia = $nome -match 'NVIDIA|GeForce|Quadro|Tesla'
        $drvTxt = ''
        if ($drvRaw) {
            if ($ehNvidia) { $drvTxt = Convert-NvidiaDriverVersion -raw $drvRaw }
            else { $drvTxt = $drvRaw }
        }

        if ($ehNvidia -or $nome -match 'Radeon RX|Radeon Pro|Radeon VII') {
            if (-not $GPU_DEDICADA_NOME) {
                $GPU_DEDICADA_NOME = $nome
                $GPU_DEDICADA_VRAM = $vramTxt
                $GPU_DEDICADA_DRIVER = $drvTxt
                $GPU_DEDICADA_FAB = Get-GpuFabricante -pnpId $c.PNPDeviceID
                if ($biosVerMap.ContainsKey($nome)) { $GPU_DEDICADA_BIOS = $biosVerMap[$nome] }
            }
        } elseif ($nome -match 'Intel|UHD Graphics|Iris|HD Graphics|Radeon\(TM\) Graphics|Radeon Graphics|Vega \d+ Graphics') {
            if (-not $GPU_INTEGRADA_NOME) {
                $GPU_INTEGRADA_NOME = $nome
                $GPU_INTEGRADA_DRIVER = $drvTxt
                if ($nome -match 'Intel') { $GPU_INTEGRADA_FAB = 'Intel' }
                elseif ($nome -match 'AMD|Radeon|Vega') { $GPU_INTEGRADA_FAB = 'AMD' }
            }
        } else {
            $outras += $nome
        }
    }
}
$GPU_OUTRAS = ($outras -join ' ;; ')

# ---------- Composicao das linhas de exibicao ----------
if ($GPU_DEDICADA_NOME) {
    $partesGpuD = @($GPU_DEDICADA_NOME)
    if ($GPU_DEDICADA_FAB) { $partesGpuD += ('FABRICANTE: ' + $GPU_DEDICADA_FAB) }
    if ($GPU_DEDICADA_VRAM -and $GPU_DEDICADA_VRAM -ne 'N/D') { $partesGpuD += ('VRAM: ' + $GPU_DEDICADA_VRAM) }
    if ($GPU_DEDICADA_DRIVER) { $partesGpuD += ('DRIVER: ' + $GPU_DEDICADA_DRIVER) }
    if ($GPU_DEDICADA_BIOS) { $partesGpuD += ('BIOS: ' + $GPU_DEDICADA_BIOS) } else { $partesGpuD += 'BIOS: Desconhecido' }
    $GPU_DEDICADA_LINHA = ($partesGpuD -join ' | ')
} else {
    $GPU_DEDICADA_LINHA = Txt 'N{a}o detectada'
}

$GPU_INTEGRADA_LINHA = ''
if ($GPU_INTEGRADA_NOME) {
    $partesGpuI = @($GPU_INTEGRADA_NOME)
    if ($GPU_INTEGRADA_FAB) { $partesGpuI += ('FABRICANTE: ' + $GPU_INTEGRADA_FAB) }
    if ($GPU_INTEGRADA_DRIVER) { $partesGpuI += ('DRIVER: ' + $GPU_INTEGRADA_DRIVER) }
    $GPU_INTEGRADA_LINHA = ($partesGpuI -join ' | ')
}

# ---------- Monitor (modelo/fabricante via EDID + resolução/taxa via a GPU) ----------
# NÃO existe API padrão do Windows para a versão da VBIOS da placa de
# vídeo (diferente da BIOS da placa-mãe, que tem Win32_BIOS) - por isso
# esse campo não entra aqui: exigiria ferramenta do fabricante (ex:
# nvidia-smi) para ser confiavel em qualquer máquina.
$mapaFabricantesMonitor = @{
    'LGD'='LG'; 'GSM'='LG'; 'SAM'='Samsung'; 'SEC'='Samsung'; 'AUO'='AU Optronics';
    'BNQ'='BenQ'; 'ACR'='Acer'; 'DEL'='Dell'; 'DELL'='Dell'; 'HWP'='HP'; 'PHL'='Philips';
    'SNY'='Sony'; 'VSC'='ViewSonic'; 'AOC'='AOC'; 'MSI'='MSI'; 'ASU'='ASUS'; 'CMN'='Chimei Innolux';
    'CPQ'='Compaq'; 'LEN'='Lenovo'; 'IVM'='Iiyama'; 'GBT'='Gigabyte'
}
function Convert-EdidTexto {
    param($arr)
    if (-not $arr) { return '' }
    $chars = @($arr) | Where-Object { $_ -ne 0 } | ForEach-Object { [char][int]$_ }
    return -join $chars
}
$MON_FAB = ''
$MON_MODELO = ''
try {
    if (Get-Command Get-CimInstance -ErrorAction SilentlyContinue) {
        $monInfo = Get-CimInstance -Namespace 'root\wmi' -ClassName WmiMonitorID -ErrorAction Stop | Select-Object -First 1
    } else {
        $monInfo = Get-WmiObject -Namespace 'root\wmi' -Class WmiMonitorID -ErrorAction Stop | Select-Object -First 1
    }
    if ($monInfo) {
        $codFab = Convert-EdidTexto $monInfo.ManufacturerName
        if ($codFab -and $mapaFabricantesMonitor.ContainsKey($codFab.ToUpper())) {
            $MON_FAB = $mapaFabricantesMonitor[$codFab.ToUpper()]
        } elseif ($codFab) {
            $MON_FAB = $codFab
        }
        $MON_MODELO = Convert-EdidTexto $monInfo.UserFriendlyName
    }
} catch {}

$MON_RES = ''
$MON_HZ = ''
if ($controllers) {
    $ctrlComRes = $controllers | Where-Object { $_.CurrentHorizontalResolution -and $_.CurrentHorizontalResolution -gt 0 } | Select-Object -First 1
    if ($ctrlComRes) {
        $MON_RES = [string]$ctrlComRes.CurrentHorizontalResolution + ' x ' + [string]$ctrlComRes.CurrentVerticalResolution
        if ($ctrlComRes.CurrentRefreshRate) { $MON_HZ = [string]$ctrlComRes.CurrentRefreshRate + 'Hz' }
    }
}

$MON_LINHA = ''
if ($MON_MODELO -or $MON_FAB -or $MON_RES) {
    $partesMon = @()
    if ($MON_MODELO) { $partesMon += $MON_MODELO } else { $partesMon += (Txt 'Monitor n{a}o identificado') }
    if ($MON_FAB) { $partesMon += ('FABRICANTE: ' + $MON_FAB) }
    if ($MON_RES) { $partesMon += $MON_RES }
    if ($MON_HZ) { $partesMon += $MON_HZ }
    $MON_LINHA = ($partesMon -join ' | ')
}

# ---------- Rede: IP, máscara, gateway, MAC, adaptador e velocidade ----------
# Feito em PowerShell (não mais em batch com ipconfig+findstr) por dois
# motivos: (1) elimina a dependencia de casar texto acentuado com o que o
# Windows imprime, que é sensível a idioma/codificação; (2) contas com
# velocidades de 2.5/5/10 Gbps em bits por segundo estouram o limite de
# inteiro 32-bit que "set /a" usa no batch.
#
# A escolha do adaptador prioriza o que tiver gateway padrão configurado
# E cujo nome não pareça um adaptador virtual/VPN/WSL/Hyper-V - isso evita
# pegar por engano um adaptador virtual (ex: WSL costuma usar a faixa
# 172.x.x.x) em vez da conexão real com a internet.
$IP_V4 = ''
$MASCARA = ''
$GATEWAY_PADRAO = ''
$MAC_ADDR = ''
$ADAPTADOR_NOME = ''
$ADAPTADOR_FAB = ''
$NET_SPEED_TXT = ''
try {
    $todasConfigs = @(Get-Info 'Win32_NetworkAdapterConfiguration' | Where-Object { $_.IPEnabled -eq $true -and $_.DefaultIPGateway })
    $padraoVirtual = 'virtual|vpn|hyper-v|wsl|loopback|tunnel|tap-windows|vethernet|npcap'
    $melhorConfig = $null
    $melhorAdpt = $null
    foreach ($cfg in $todasConfigs) {
        $adptCandidato = Get-Info 'Win32_NetworkAdapter' | Where-Object { $_.Index -eq $cfg.Index } | Select-Object -First 1
        $nomeCandidato = ''
        if ($adptCandidato) { $nomeCandidato = $adptCandidato.Name }
        $ehVirtual = $nomeCandidato -match $padraoVirtual
        if (-not $ehVirtual) {
            $melhorConfig = $cfg
            $melhorAdpt = $adptCandidato
            break
        }
        if (-not $melhorConfig) { $melhorConfig = $cfg; $melhorAdpt = $adptCandidato }
    }
    if ($melhorConfig) {
        if ($melhorConfig.IPAddress -and $melhorConfig.IPAddress.Count -gt 0) { $IP_V4 = $melhorConfig.IPAddress[0] }
        if ($melhorConfig.IPSubnet -and $melhorConfig.IPSubnet.Count -gt 0) { $MASCARA = $melhorConfig.IPSubnet[0] }
        if ($melhorConfig.DefaultIPGateway -and $melhorConfig.DefaultIPGateway.Count -gt 0) { $GATEWAY_PADRAO = $melhorConfig.DefaultIPGateway[0] }
        if ($melhorConfig.MACAddress) { $MAC_ADDR = $melhorConfig.MACAddress }
        if ($melhorAdpt) {
            $ADAPTADOR_NOME = Get-ValorLimpo $melhorAdpt.Name
            $ADAPTADOR_FAB = Get-ValorLimpo $melhorAdpt.Manufacturer
            if ($melhorAdpt.Speed) {
                $bps = [double]$melhorAdpt.Speed
                if ($bps -ge 1000000000) {
                    $gbps = [math]::Round($bps / 1000000000, 1)
                    if ($gbps -eq 2.5) { $NET_SPEED_TXT = '2.5 Gbps (2.5GbE)' }
                    elseif ($gbps -eq 5) { $NET_SPEED_TXT = '5 Gbps (5GbE)' }
                    elseif ($gbps -eq 10) { $NET_SPEED_TXT = '10 Gbps (10GbE)' }
                    elseif ($gbps -eq 1) { $NET_SPEED_TXT = '1 Gbps (Gigabit)' }
                    else { $NET_SPEED_TXT = [string]$gbps + ' Gbps' }
                } elseif ($bps -ge 1000000) {
                    $mbps = [math]::Round($bps / 1000000, 0)
                    $NET_SPEED_TXT = [string]$mbps + ' Mbps'
                }
            }
        }
    }
} catch {}
if (-not $IP_V4) { $IP_V4 = 'Desconhecido' }
if (-not $MASCARA) { $MASCARA = 'Desconhecido' }
if (-not $GATEWAY_PADRAO) { $GATEWAY_PADRAO = 'Desconhecido' }
if (-not $MAC_ADDR) { $MAC_ADDR = 'Desconhecido' }
if (-not $ADAPTADOR_NOME) { $ADAPTADOR_NOME = 'Desconhecido' }
if (-not $ADAPTADOR_FAB) { $ADAPTADOR_FAB = 'Desconhecido' }

# ---------- IP público (endereço visto pela internet) ----------
$IP_PUBLICO = 'Desconhecido'
try {
    # WebRequest is available on older Windows PowerShell versions too.
    $request = [Net.WebRequest]::Create([Uri]'https://api.ipify.org')
    $request.Method = 'GET'
    $request.Timeout = 5000
    $request.ReadWriteTimeout = 5000
    $response = $request.GetResponse()
    try {
        $reader = New-Object IO.StreamReader($response.GetResponseStream())
        try { $textoIp = $reader.ReadToEnd().Trim() } finally { $reader.Dispose() }
    } finally {
        $response.Close()
    }
    if ($textoIp -match '^\d{1,3}(\.\d{1,3}){3}$') { $IP_PUBLICO = $textoIp }
} catch {
    $IP_PUBLICO = 'Desconhecido'
}

# ---------- Teste de resolução DNS ----------
$DNS_MS = 'N/D'
$DNS_STATUS = 'Falhou'
try {
    $swDns = [System.Diagnostics.Stopwatch]::StartNew()
    $resolvido = [System.Net.Dns]::GetHostAddresses('cloudflare.com')
    $swDns.Stop()
    if ($resolvido -and $resolvido.Count -gt 0) {
        $DNS_MS = [math]::Round($swDns.Elapsed.TotalMilliseconds, 0)
        if ($DNS_MS -le 30) { $DNS_STATUS = 'Excelente' }
        elseif ($DNS_MS -le 80) { $DNS_STATUS = 'Boa' }
        elseif ($DNS_MS -le 200) { $DNS_STATUS = 'Regular' }
        else { $DNS_STATUS = 'Lenta' }
    }
} catch {
    $DNS_STATUS = 'Falhou'
    $DNS_MS = 'N/D'
}

# ---------- Teste de Ping nativo via .NET ----------
function Get-PingStats {
    param([string]$alvo, [int]$qtd = 4)
    $tempos = @()
    $perdidos = 0
    $pinger = New-Object System.Net.NetworkInformation.Ping
    for ($i = 0; $i -lt $qtd; $i++) {
        try {
            $resp = $pinger.Send($alvo, 2000)
            if ($resp -and $resp.Status -eq [System.Net.NetworkInformation.IPStatus]::Success) {
                $tempos += [int]$resp.RoundtripTime
            } else {
                $perdidos++
            }
        } catch {
            $perdidos++
        }
    }
    $min = 0; $max = 0; $avg = 0; $jit = 0
    if ($tempos.Count -gt 0) {
        $min = ($tempos | Measure-Object -Minimum).Minimum
        $max = ($tempos | Measure-Object -Maximum).Maximum
        $avg = [math]::Round((($tempos | Measure-Object -Average).Average), 0)
    }
    if ($tempos.Count -ge 2) {
        $difs = @()
        for ($i = 1; $i -lt $tempos.Count; $i++) { $difs += [math]::Abs($tempos[$i] - $tempos[$i-1]) }
        $jit = [math]::Round((($difs | Measure-Object -Average).Average), 0)
    }
    $perdaPct = [math]::Round((($perdidos / $qtd) * 100), 0)
    $out = New-Object PSObject
    $out | Add-Member NoteProperty Tempos ($tempos -join ',')
    $out | Add-Member NoteProperty Min $min
    $out | Add-Member NoteProperty Max $max
    $out | Add-Member NoteProperty Avg $avg
    $out | Add-Member NoteProperty Jitter $jit
    $out | Add-Member NoteProperty PerdaPct $perdaPct
    $out | Add-Member NoteProperty Recebidos $tempos.Count
    return $out
}

$ping1 = Get-PingStats -alvo '1.1.1.1'
$ping2 = Get-PingStats -alvo '8.8.8.8'

# ---------- Monta a saída e grava em CP850 diretamente no arquivo ----------
# CP850 (não UTF-8) porque e a página de código clássica do console do
# Windows - funciona com a fonte Raster (bitmap) sem exigir troca para
# fonte TrueType, o que evita texto "pesado"/glifos errados que UTF-8 +
# A codificação é configurada pela API do console para manter compatibilidade.
$linhas = New-Object System.Collections.Generic.List[string]
$linhas.Add("SO_CAPTION=" + $SO_CAPTION)
$linhas.Add("SO_VERSAO=" + $SO_VERSAO)
$linhas.Add("SO_ARQ=" + $SO_ARQ)
$linhas.Add("SO_UPTIME=" + $SO_UPTIME)
$linhas.Add("MB_FAB=" + $MB_FAB)
$linhas.Add("MB_MODELO=" + $MB_MODELO)
$linhas.Add("BIOS_VER=" + $BIOS_VER)
$linhas.Add("CPU_NOME=" + $CPU_NOME)
$linhas.Add("CPU_FREQ=" + $CPU_FREQ)
$linhas.Add("CPU_NUCLEOS=" + $CPU_NUCLEOS)
$linhas.Add("CPU_THREADS=" + $CPU_THREADS)
$linhas.Add("RAM_LINHA=" + $RAM_LINHA)
$linhas.Add("STOR_MODELO=" + $STOR_MODELO)
$linhas.Add("STOR_TIPO=" + $STOR_TIPO)
$linhas.Add("STOR_BUS=" + $STOR_BUS)
$linhas.Add("STOR_GB=" + $STOR_GB)
$linhas.Add("GPU_DEDICADA_LINHA=" + $GPU_DEDICADA_LINHA)
$linhas.Add("GPU_INTEGRADA_LINHA=" + $GPU_INTEGRADA_LINHA)
$linhas.Add("GPU_OUTRAS=" + $GPU_OUTRAS)
$linhas.Add("GPU_TOTAL=" + $totalGPU)
$linhas.Add("MON_LINHA=" + $MON_LINHA)
$linhas.Add("IP_V4=" + $IP_V4)
$linhas.Add("MÁSCARA=" + $MASCARA)
$linhas.Add("GATEWAY_PADRAO=" + $GATEWAY_PADRAO)
$linhas.Add("MAC_ADDR=" + $MAC_ADDR)
$linhas.Add("ADAPTADOR_NOME=" + $ADAPTADOR_NOME)
$linhas.Add("ADAPTADOR_FAB=" + $ADAPTADOR_FAB)
$linhas.Add("IP_PUBLICO=" + $IP_PUBLICO)
$linhas.Add("NET_SPEED_TXT=" + $NET_SPEED_TXT)
$linhas.Add("DNS_MS=" + $DNS_MS)
$linhas.Add("DNS_STATUS=" + $DNS_STATUS)
$linhas.Add("PING1_TEMPOS=" + $ping1.Tempos)
$linhas.Add("PING1_MIN=" + $ping1.Min)
$linhas.Add("PING1_MAX=" + $ping1.Max)
$linhas.Add("PING1_AVG=" + $ping1.Avg)
$linhas.Add("PING1_JITTER=" + $ping1.Jitter)
$linhas.Add("PING1_PERDA=" + $ping1.PerdaPct)
$linhas.Add("PING1_RECEBIDOS=" + $ping1.Recebidos)
$linhas.Add("PING2_TEMPOS=" + $ping2.Tempos)
$linhas.Add("PING2_MIN=" + $ping2.Min)
$linhas.Add("PING2_MAX=" + $ping2.Max)
$linhas.Add("PING2_AVG=" + $ping2.Avg)
$linhas.Add("PING2_JITTER=" + $ping2.Jitter)
$linhas.Add("PING2_PERDA=" + $ping2.PerdaPct)
$linhas.Add("PING2_RECEBIDOS=" + $ping2.Recebidos)

$utf8SemBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllLines($OutPath, $linhas, $utf8SemBom)
