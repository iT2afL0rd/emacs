;; Quail package `chinese-py' -*- coding:cn-gb-2312 -*-
;;   Generated by the command `miscdic-convert'
;;   Date: Tue Aug 28 19:39:35 2012
;;   Source dictionary file: pinyin.map
;;   Copyright notice of the source file
;;------------------------------------------------------
;; "pinyin.map" is included in a free package called CCE.  It is
;; available at:
;;	http://ftp.debian.org/debian/dists/potato/main
;;		/source/utils/cce_0.36.orig.tar.gz
;; This package contains the following copyright notice.
;;
;;
;;             Copyright (C) 1999, Rui He, herui@cs.duke.edu
;;
;;
;;                  CCE(Console Chinese Environment) 0.32
;;
;; CCE is free software; you can redistribute it and/or modify it under the
;; terms of the GNU General Public License as published by the Free Software
;; Foundation; either version 1, or (at your option) any later version.
;;
;; CCE is distributed in the hope that it will be useful, but WITHOUT ANY
;; WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
;; details.
;;
;; You should have received a copy of the GNU General Public License along with
;; CCE; see the file COPYING.  If not, write to the Free Software Foundation,
;; 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
;;------------------------------------------------------

;;; Code:

(require 'quail)
(quail-define-package "chinese-py" "Chinese-GB" "ƴG" t
"���������ƴ����

	ƴ������

 СдӢ����ĸ������ƴ�������ţ� \"u(yu) ���� u: ��ʾ��

Pinyin base input method for Chinese charset GB2312 (`chinese-gb2312').

Pinyin is the standard roman transliteration method for Chinese.
Pinyin uses a sequence of Latin alphabetic characters for each Chinese
character.  The sequence is made by the combination of the initials
(the beginning sounds) and finals (the ending sounds).

  initials: b p m f d t n l z c s zh ch sh r j q x g k h
  finals: a o e i er ai ei oa ou an en ang eng ong i ia iao ie iu ian in
          iang ing iong u ua uo uai ui uan un uan ueng yu yue yuan yun

  (Note: In the correct Pinyin writing, the sequence \"yu\" in the last
   four finals should be written by the character u-umlaut `��'.)

With this input method, you enter a Chinese character by first
entering its pinyin spelling.

\\<quail-translation-docstring>

For instance, to input ��, you type \"n i C-n 3\".  The first \"n i\"
is a Pinyin, \"C-n\" selects the next group of candidates (each group
contains at most 10 characters), \"3\" select the third character in
that group.

This input method supports only Han characters.  The related input
method `chinese-py-punct' is the combination of this method and
`chinese-punct'; it supports both Han characters and punctuation
characters.

For double-width GB2312 characters corresponding to ASCII, use the
input method `chinese-qj'.

The correct Pinyin system specifies tones by diacritical marks, but
this input method doesn't use them, which results in easy (you don't
have to know the exact tones), but verbose (many characters are assigned
to the same key sequence) input.  You may also want to try the input
method `chinese-tonepy' with which you must specify tones by digits
(1..5)."
  '(("" . quail-delete-last-char)
   ("." . quail-next-translation)
   (">" . quail-next-translation)
   ("," . quail-prev-translation)
   ("<" . quail-prev-translation))
  nil nil nil nil)

(quail-define-rules
("a" "�����������߹")
("ai" "�������������������������������������������")
("an" "�������������������������ư��������")
("ang" "������")
("ao" "�°İ���������������������������������������")
("ba" "�Ѱ˰ɰͰְհΰȰŰ԰аǰ̰ϰӰʰ����������ᱰ�����")
("bai" "�ٰװܰڲ��ݰ�������۰�")
("ban" "����������߰���������������")
("bang" "�������������亰������")
("bao" "���������������������������ٰ��������������������")
("bei" "��������������������������㣱��±��������������������ɱ�")
("ben" "�����������������")
("beng" "���±��ı�괱��԰�")
("bi" "�ȱرʱϱұܱձǱ˱Ʊڱ۱ױ̱ɱбα�ذ赱ֱ������㹱��������������޵�����������������Ա����ݩ��������������")
("bian" "���߱�����ޱ������������������������������")
("biao" "������ڱ�����������������")
("bie" "��������")
("bin" "���������������ı�������������")
("bing" "������������������������")
("bo" "�����������������ذ������������������������粤������������뢲�����������")
("bu" "����������������������߲�������������")
("ca" "������")
("cai" "�Ųɲ˲ƲĲʲò²̲Ȳ�")
("can" "�βͲвҲӲѲ������������")
("cang" "�زԲֲײ���")
("cao" "�ݲٲܲ��в������")
("ce" "�߲��޲���")
("cen" "����")
("ceng" "�������")
("cha" "������ɲ�����������������������������")
("chai" "�������٭���")
("chan" "��������������������������Ʋ��������������������")
("chang" "�����������������������ȳ���潲���������������������")
("chao" "�����������������³���������")
("che" "����������������")
("chen" "�Ƴ³��������óĳ�����衳���������������")
("cheng" "�ɳǳ̳Ƴг�ʢ�˳ʳųͳγ�������ة������������������")
("chi" "�Գֳٳ߳��سճݳ۳ܳ�׳�����ള������߳�����������ܯ����������������")
("chong" "�س���������������")
("chou" "������������㰳����ٱ���")
("chu" "�������������������������������ƴ����������ۻ������ء��")
("chuai" "�����������")
("chuan" "�������������������밴���")
("chuang" "��������������")
("chui" "��������������")
("chun" "������������������ݻ")
("chuo" "�´�������")
("ci" "�˴δʲ�̴ǴȴŴʹ��ȴĴ�������������")
("cong" "�ӴҴϴԴд������������")
("cou" "������")
("cu" "�ٴִش����������������")
("cuan" "�ܴܴ۴�ߥ������")
("cui" "���ߴݴ��ʹ�������������")
("cun" "��������")
("cuo" "�������������������������")
("da" "���������������������������")
("dai" "���������������������쵡����ʴ�߾���ܤ߰")
("dan" "���������������������������壵����������������̵���")
("dang" "�����������������������")
("dao" "����������������������߶���������")
("de" "�ĵõ��")
("deng" "�ȵǵƵ˵ʵɵ������������")
("di" "�ص���׵͵۵ܵеֵݵεϵٵ̵ѵ޵���ڮ�е�ۡ���յ�����ݶ����������ص�������")
("dia" "��")
("dian" "�����ߵ��������������ڵ�������������ؼ")
("diao" "����������������������")
("die" "������������������������ܦ�������")
("ding" "������������������������궧���������")
("diu" "����")
("dong" "�����������������˶���������������")
("dou" "����������������������")
("du" "�����ȶ������ɶǶŶö¶Ķ������빶ƶ�������ܶ�")
("duan" "�϶ζ̶˶Ͷ������")
("dui" "�ԶӶѶ���������")
("dun" "�ٶֶܶض׶���������ڶ���������")
("duo" "����������Ͷ�߶����Զ������������")
("e" "������Ŷ���㵶�ج����������湶�������������������������ݭ")
("ei" "��")
("en" "������")
("er" "�����������Ƕ���������ܷ�٦")
("fa" "�����������������ҷ�")
("fan" "���������������������������������ެ�������")
("fang" "���ŷ��÷��·������ݷ�������������")
("fei" "�ǷѷɷϷʷȷзƷη˷��������������������������������")
("fen" "�ַݷ׷ܷ߷۷շҷطٷ�޷Է�������������")
("feng" "�����������������ٺ����ۺ����")
("fo" "��")
("fou" "���")
("fu" "�򸮷����������������������������������������������������������������������ܽ���ڸ����������������������ݳ�������������������������������߻��ۮ�������������")
("ga" "���θ¸���٤�������")
("gai" "�ĸøŸ�ؤ����������")
("gan" "�иɸҸϸʸθ��ϸ��ϸ͸�ߦ���ո���������������")
("gang" "�ո۸ָڸٸ׿��ܸԸ������")
("gao" "�߸�����޸�غ��޻�ɸݸ�ھ���۬�")
("ge" "����������������������������������������تܪ�����������")
("gei" "��")
("gen" "����ب����ݢ")
("geng" "�������������������ṡ�")
("gong" "�����������������������������Ź������")
("gou" "�������������������������ڸ�������������")
("gu" "�ʹŹ˹ɹĹùǹ̹¹ȹ��͹���������������������������������������ڬ������������")
("gua" "�ҹϹι��ɹ��Թ������ڴ")
("guai" "�ֹԹ���")
("guan" "�ع۹ܹٹݹ߹ڹ�޹��ݸ��������������")
("guang" "������������")
("gui" "����������������������������������Ȳ��������")
("gun" "��������޹���")
("guo" "���������������������������������")
("ha" "������")
("hai" "���������ٿȺ�������������")
("han" "������������������������������������������ۺ��������������")
("hang" "�к��ﺼ���������")
("hao" "�úź����ƺ�𩺿껺º����尸�����޶���")
("he" "�ͺκϺӺȺպ��źغкǺ̺ɺ��ֺҺ�ڭ����������������������")
("hei" "�ں���")
("hen" "�ܺ޺ݺ�")
("heng" "����ߺ�޿����")
("hong" "��������������ްڧޮ����ݦ")
("hou" "�����������������ܩ������")
("hu" "���������������������������䰻����������������������������������������������������")
("hua" "�����������������뻫������")
("huai" "������������")
("huan" "�������������û��»�����߻��ۼ���ٻ���ۨ�����ߧ�������")
("huang" "�ƻʻĻλŻͻ̻л����ɻ˻��������������������")
("hui" "��ػ�ӻԻһݻٻڻֻۻ�ջ�߻��޻��ڶ�������������๻������ޥ�������������")
("hun" "�������ƻ�ڻ������")
("huo" "�ͻ����������������������߫޽�����")
("ji" "���������Ǽ��Ƽ����ü������ļʼ����ͻ��漱���̼Ȼ��������������ż����������ɼ���������������ߴ�������˼�����������᧼������ؽڵ����������������������������������٥��ܸآ��ު����������������������������")
("jia" "�ҼӼۼټܼ׼Ѽݼм޼μּ���ٮЮ���ļ������٤������ռ��������ۣ����������������������")
("jian" "���������������콡�潣������������������������������߼��������Խ���������ﵽ�����������������������������������������")
("jiang" "����ǿ������������������������筽������������")
("jiao" "�̽���У�нϽǽŽ������ν������ɽʽȽ��ý�ٮ�ƽ���毽ѽ˽�𨽶�ͽ��������������Խ�ܴ��������")
("jie" "���ӽ�ڽֽ�׽���ܽ�Խݽؽ�ҽٽ߽�޽�������ٽ�ڵ������ڦ�ܽ����������")
("jin" "������������������������������������ƽ�����������ݣ���������")
("jing" "����������������������������������������㽾���������캾��ɾ�����ݼ������������")
("jiong" "����������")
("jiu" "�;ž��ƾþɾȾ����ξ˾����ľ�౾������־Ǿ�������")
("ju" "�־ݾӾ�پ߾�޾۾ܾ���վоؽ۾ԾϾ׾��ľ���������������ƾ������������������ڪ��︾������������")
("juan" "�����������������۲������")
("jue" "�������Ž�����Ⱦ��������������Ǿ�������������������ާ��")
("jun" "���������������޾������������ܿ�")
("ka" "������������")
("kai" "�������������������������")
("kan" "����٩���������������ݨ�")
("kang" "��������������������")
("kao" "����������������")
("ke" "�ɿ˿ƿͿ̿οſʿºǿ�㡿ȿ��Ŀǿ�����������������������������")
("ken" "�Ͽҿп�����")
("keng" "�ӿ��")
("kong" "�տֿؿ�������")
("kou" "�ڿۿٿ�ߵޢ������")
("ku" "��޿���ݿ�����ܥ��")
("kua" "������٨")
("kuai" "���������������ۦ")
("kuan" "�����")
("kuang" "����������������ڲ��ڿ������")
("kui" "��������������ӿ����ѿ������ظ�������������������")
("kun" "��������������������")
("kuo" "������������")
("la" "�����������������������")
("lai" "���������������������")
("lan" "����������������������������������������")
("lang" "�����������������ݹ�������")
("lao" "�����������������������������������")
("le" "��������߷������")
("lei" "����������������������ڳ��������������")
("leng" "�������ܨ")
("li" "���������������������������������������������������������������ݰ����ٵ��޼ٳ����۪�������������������ت���������޺߿�������������������������������")
("lia" "��")
("lian" "������������������������������������������������")
("liang" "��������������������������ݹܮ�����")
("liao" "������������������������������������ޤ��")
("lie" "�������������������������")
("lin" "���������������������������������������������")
("ling" "������������������������������������������������۹������")
("liu" "������½������µ��������������������������")
("long" "��¡����£����¢����¤�����������")
("lou" "¥ª©§�¨��¦��������������")
("lu" "·½¼¬¶³¯¹µ®«��­»�±²´��¸��¾������°º��ߣ������ޤ���������������")
("lv" "������������������¿�������������������")
("luan" "��������������������")
("lue" "�����")
("lun" "����������������")
("luo" "�����������������������������������������������������")
("m" "߼")
("ma" "��������������Ĩ������������")
("mai" "��������������۽ݤ")
("man" "�����������������áܬ�������������")
("mang" "æãäâåç��������")
("mao" "ëðèóìñòéï��î��ê����í��������������")
("me" "ô��")
("mei" "û��ÿ��ü÷ýö��ú��ùõ��������øݮ�����������þ")
("men" "��������������")
("meng" "���������������������ޫ�������������")
("mi" "��������������������������������������������������������")
("mian" "������������������������������")
("miao" "�������������������������������")
("mie" "��������ؿ�")
("min" "�������������������������������")
("ming" "����������ڤ�����������")
("miu" "����")
("mo" "ĬĪģ��ĩĥ��ĦįĮīĨħİ��ĭĤ��Ģ����ġ�������������������")
("mou" "ĳı��������ٰ��")
("mu" "ĿĸľĻķĽ��ĹļĺĲĶ����Ĵ��ĵ���������")
("n" "����")
("na" "������������������������")
("nai" "����������ܵؾ٦����")
("nan" "������������������")
("nang" "������߭��")
("nao" "����������������ث������")
("ne" "��ګ")
("nei" "����")
("nen" "����")
("neng" "��")
("ng" "����")
("ni" "������������������������������������٣������")
("nian" "����إճ�������������������")
("niang" "����")
("niao" "������������")
("nie" "�����������������ؿ�������")
("nin" "����")
("ning" "����šŢ�������������")
("niu" "ţŦŤ�ť������")
("nong" "ũŪŨٯ��ŧ")
("nou" "��")
("nu" "ŭŬū��������")
("nv" "Ů������")
("nuan" "ů")
("nue" "Űű")
("nuo" "ŵŲųŴ�������")
("o" "Ŷ���")
("ou" "ŷżŹŻŸک�źŽ����")
("pa" "��������ſž�����������")
("pai" "������������ٽ����")
("pan" "�����������������������������")
("pang" "�������Ұ�����������")
("pao" "������������������������")
("pei" "�����������������������������")
("pen" "������")
("peng" "����������������������������ܡ�����")
("pi" "����Ƥƨ��ƣ��ơƢƥƧ��Ʃ��Ʀ�����������ۯ���اܱ�����������������ߨ�������������������")
("pian" "��Ƭƪƫƭ���������������")
("piao" "ƱƯƮư������������ݳ��")
("pie" "ƲƳ�د��")
("pin" "ƷƶƴƵƸ���������")
("ping" "ƽ��ƿƾƼƹ��ƻƺ���ٷ��")
("po" "���������²����������������������۶�")
("pou" "������")
("pu" "�����������������͸��������������������������")
("qi" "�������������������������������������������������������������������������������ؽ��������ٹ�����������ܻ������ݽ����������ޭ��������������")
("qia" "ǡǢ��٤������")
("qian" "ǰǮǧǩǷǣǳǱǨǫǲǸ��ǶǬǴǦ�ǯ�ٻǵǭ���ܷ����ݡ����������ǥǪ���������Ǥ���")
("qiang" "ǹǽ��ǻǺ����ǼǾ������������������")
("qiao" "�����������������������������������ڽ��������������")
("qie" "����������������٤����ۧ���")
("qin" "��������������������������������������������")
("qing" "������������������������������������������������")
("qiong" "�����������������")
("qiu" "������������������ٴ������������������������")
("qu" "ȥȡ����Ȥ����������Ȣ�����������������������ڰ�۾ޡ޾ȣ��������")
("quan" "ȫȨȦȰȪȯȭȮڹȧ�������Ȭ������ȩ��")
("que" "ȴȷȱȸȳȶȵ����Ȳ��")
("qun" "Ⱥȹ����")
("ran" "ȻȾȼȽ������")
("rang" "��������ȿ���")
("rao" "�����������")
("re" "������")
("ren" "���������������������������������")
("reng" "����")
("ri" "��")
("rong" "������������������������������")
("rou" "������������")
("ru" "����������������������������޸������")
("ruan" "������")
("rui" "�������ި�����")
("run" "����")
("ruo" "����ټ��")
("sa" "������ئ�������")
("sai" "����������")
("san" "��ɢɡ���������")
("sang" "ɥɣɤ�����")
("sao" "ɨɧɩ����ɦ������ܣ��")
("se" "ɫ��ɬɪ����")
("sen" "ɭ")
("seng" "ɮ")
("sha" "ɱɳɶɵ��ɲɴɯɷɰ����������������")
("shai" "ɹɸ��")
("shan" "ɽ������ɾɿ����ɺɼ�ò���դڨ������������ӵ�������������۷��ɻ�������")
("shang" "�������������������������")
("shao" "��������������������������ۿ���������")
("she" "�����������������������������������")
("shei" "˭")
("shen" "ʲ�����������������������������ݷ����������ڷ�����������")
("sheng" "����ʡʤ��ʥʢʣ����������������")
("shi" "��ʱʮ��ʵʹ����ʶʼʿʦʫʽʧʷ��ʾʳ������ʯ��ʩ����ʻ��ʬʰ��ʪ��ʨ��ʴ��ʺ�̳�����������ʸ����ʭ߱����ݪ���������������������")
("shou" "�������������������������")
("shu" "��������������������������������������������ˡ������������������ٿ������������������ح������")
("shua" "ˢˣ�")
("shuai" "��˥ˤ˦˧�")
("shuan" "��˨˩��")
("shuang" "˫ˬ˪����")
("shui" "ˮ˭˰˯")
("shun" "˳˴˲˱")
("shuo" "˵˷˶˸����������")
("si" "����˼˹˾��˽˿��˺����˻�������������ٹ�����������������������")
("song" "���������������������ݿ����ڡ�")
("sou" "����������޴�������������")
("su" "���������������������������������������")
("suan" "�������")
("sui" "�������������������������ݴ�������")
("sun" "������ݥ������")
("suo" "�������������������������������")
("ta" "������̤������̣����̢������������̡")
("tai" "̨̧̫̬̩̥̭̦߾��ۢ޷̪����������")
("tan" "̸̽��̷̶̹̳̯̰̲̺̱̾̿��̵��̮̻̼�̴���۰����")
("tang" "�����������������������������������������������")
("tao" "������������������������������ػ")
("te" "����߯���")
("tei" "߯")
("teng" "����������")
("ti" "���������������������������������������������")
("tian" "���������������������������")
("tiao" "��������������٬���������������")
("tie" "����������")
("ting" "��ͣͥ��ͦͤ��ͧ͢���͡������������")
("tong" "ͬͨͳʹͯͮͲͭͰͱͩͫ١��ͪ�����������������")
("tou" "ͷͶ͵͸����")
("tu" "��ͻͼ;ͽ��Ϳ����ͺ͹ݱ������ܢ")
("tuan" "���������")
("tui" "������������߯��")
("tun" "��������ζ�������")
("tuo" "������������������������������ر����٢������������")
("wa" "���������۰����������")
("wai" "������")
("wan" "������������������������������ݸ���������������ܹ���")
("wang" "�����������������������������")
("wei" "ΪλδίάζΧ����΢ΰνΨΣοβΥκ��εαηθι�ΤΩΡγή�έξ�μ���ޱ������������ΦΫ�������������������������")
("wen" "�����������������������������")
("weng" "��������޳")
("wo" "������������������������ݫ�����")
("wu" "������������������������������������������������������أ���������������������������������������������������")
("xi" "��ϵϢϣϲϯϰϸϷ��ϴϧϡϤ��Ϧ��Ϯ������Ϫ϶������ϱ��ϨϥۭϬ�����������������ϫ��������ϩ�����ϭ�����������ϳݾ�������������������������")
("xia" "������Ͽ������ϼϹϾϺ��Ͻ��ϻ���������������")
("xian" "���������������������������������������������������������������ݲ������ϳ�������޺��������")
("xiang" "������������������������������������������������������ܼ��")
("xiao" "СЦУ��Ч������Ф��Т������Х�����������������������������")
("xie" "ЩдлЭЬЯбйвЪгаемжЮик��з�����ߢШ�Ы���ޯ��������������")
("xin" "����������нܰ��о�����п���ض")
("xing" "���������������������������������ߩ�������")
("xiong" "��������������ܺ")
("xiu" "���������޳�������������������������")
("xu" "�����������������������������������������ڼ�����������������������ޣ")
("xuan" "ѡ������ȯ����������Ѥѣ��������������������Ѣ������")
("xue" "ѧѪѩ��Ѩ��ѥѦ��������")
("xun" "ѰѯѵѸѶѲѷѭѮѬѫѱ��ѳ������������޹Ѵۨ���������ަ��")
("ya" "��ѹ����ѽѺ����ѻ��Ѽ��Ѿѿ�����������������������������")
("yan" "��������������������������������������������������������ٲ����������������������������������ܾ������������������۱���۳������������")
("yang" "�������������������������������������������������")
("yao" "Ҫҡҩҫң����ҦҧҢҥ��Ҥز����ߺԿ���������Ҩ���س������������")
("ye" "ҲҵҹүҶҰҳҺҮ��ҷק��ҭ��ұҬҴҸ����������")
("yi" "һ����������ҽ�������������������������������������������۰�����������������������������������������������������߽߮ܲ����Ҿ�����޲�����������������������������٫��ڱ����Ҽ������������ҿ���������������������")
("yin" "������ӡ�������������������������������ط۴������������ܧ������")
("ying" "ӦӢӰӪӭӲӳӮӯӱӥӤӬӣӨӫ��ө��ݺ���ӧ����������������۫���������")
("yo" "Ӵ�")
("yong" "����ӵ��ӿӻӾӹӶӽٸӺ���ӷ����Ӹ�������ܭӼ�")
("you" "����������������������������������������������ݬ�������������������������ݯ٧ݵ�����")
("yu" "�������������������Ԥ����������������Ԣԥ��������������ԣ����ԡ�����������������Ԧ��������������ع��خ���������������������������������������ٶ������������������������������������")
("yuan" "ԱԪԭԺԶԸ԰ԴԲԹԵԮԩԬԨԷԳԧԯԫ������ܾ�����������ܫ�����")
("yue" "����ԽԼ��ԾԻ������Կ����������")
("yun" "��������������������ܿ�������������۩������")
("za" "������զ������")
("zai" "��������������������")
("zan" "���������������������")
("zang" "���������������")
("zao" "��������������������������������")
("ze" "��������զ�����������������")
("zei" "��")
("zen" "����")
("zeng" "������������")
("zha" "ը��զթէգ����դ��բե���������߸ա����������")
("zhai" "ժծլխիկ�����")
("zhan" "սչվռմնշճյոհ��պտղձջ�����")
("zhang" "������������������������������������۵������")
("zhao" "�������г���������������گ��������")
("zhe" "��������������������������������ߡ������")
("zhen" "������������������������������������������������������������")
("zheng" "����֤��������֣֢����������������ں����֡")
("zhi" "ֻ֪֮����ֱ��ָ֧־ְ��ֵֹֽ֯��ִ����ַ֦��ֲּ��������ֿ֭��ֳ֥֨֫֬��ֶ��ֺ֩������������������������������ش������ۤ�������������������������������")
("zhong" "��������������������������ڣ�����")
("zhou" "��������������������������������������ݧ������")
("zhu" "��סע����������פ��ף��������������������������������������������������������������٪����ۥ��")
("zhua" "ץצ")
("zhuai" "ק��")
("zhuan" "��רת׬׫ש׭�����")
("zhuang" "װ״׳ׯײױ��׮������")
("zhui" "׷׹׺׶׸��׵�����")
("zhun" "׼׻���")
("zhuo" "����׽׿������׾����������������پ����ߪ")
("zi" "������������������֨�������������������������������������������������������")
("zong" "����������������������")
("zou" "����������������۸")
("zu" "����������������������")
("zuan" "׬��߬������")
("zui" "������������ީ")
("zun" "��������ߤ")
("zuo" "�������������������������������������")
)
