class Channel {
  String title;
  String url;
  String logo;
  Channel({required this.title, required this.url, required this.logo});
}

List<Channel> Channels = [
  Channel(
      title: 'شبکه یک ',
      url: 'https://live.aionet.ir/hls/tv1/tv1.m3u8',
      logo: 'https://dl.hitaldev.com/tv/1.png'),
  Channel(title: 'شبکه دو ', url: '', logo: 'https://dl.hitaldev.com/tv/2.png'),
  Channel(title: 'شبکه سه ', url: '', logo: 'https://dl.hitaldev.com/tv/3.png'),
  Channel(
      title: 'شبکه چهار', url: '', logo: 'https://dl.hitaldev.com/tv/4.png'),
  Channel(title: 'شبکه پنج', url: '', logo: 'https://dl.hitaldev.com/tv/5.png'),
  Channel(
      title: ' اموزش ',
      url: '',
      logo: 'https://dl.hitaldev.com/tv/amoozesh.png'),
  Channel(
      title: ' پویا ', url: '', logo: 'https://dl.hitaldev.com/tv/koodak.png'),
  Channel(
      title: 'ورزش',
      url: 'https://live.aionet.ir/hls/tv1/tv1.m3u8',
      logo: 'https://dl.hitaldev.com/tv/varzesh.png'),
  Channel(
      title: 'مستند', url: '', logo: 'https://dl.hitaldev.com/tv/mostanad.png'),
  Channel(
      title: 'نمایش', url: '', logo: 'https://dl.hitaldev.com/tv/namayesh.png'),
  Channel(title: 'نسیم', url: '', logo: 'https://dl.hitaldev.com/tv/nasim.png'),
  Channel(
      title: 'تماشا', url: '', logo: 'https://dl.hitaldev.com/tv/tamasha.png'),
];
