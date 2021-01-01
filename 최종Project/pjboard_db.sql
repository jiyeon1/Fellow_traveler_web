-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: pjboard_db
-- ------------------------------------------------------
-- Server version	5.7.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pjboard_tbl`
--

DROP TABLE IF EXISTS `pjboard_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjboard_tbl` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `title` varchar(40) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `passwd` varchar(10) DEFAULT NULL,
  `ref` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjboard_tbl`
--

LOCK TABLES `pjboard_tbl` WRITE;
/*!40000 ALTER TABLE `pjboard_tbl` DISABLE KEYS */;
INSERT INTO `pjboard_tbl` VALUES (1,'a','a','a','a',1),(2,'b','b','b','b',2),(3,'c','c','c','c',3),(4,'e','e','e','e',4),(5,'f','f','f','f',5),(6,'g','g','g','g',6),(7,'ff','ff','ff','ff',5),(8,'h','h','h','h',8),(9,'i','i','공개 열애 중인 방송인 전현무와 모델 한혜진 커플이 결별설에 휩싸였다. \n\n8일 인터넷 커뮤니티 등을 중심으로 전현무와 한혜진의 결별설이 제기됐다. 네티즌은 전현무 한혜진의 결별설 근거로 MBC 예능 프로그램 \'나 혼자 산다\'에서 두 사람이 서로에 대한 리액션이 적어졌다는 것을 이유로 들었다. \n\n지난 7일 방송된 \'나 혼자 산다\'에서는 무지개 멤버들이 함께 스튜디오에서 영상을 보며 코멘트를 나눴다. 이날 방송 직후 일부 시청자들은 전현무와 한혜진이 평소보다 반응이 작고, 교류가 없었다고 주장하며 결별설을 제기했다. 한혜진이 전현무이 말에 거의 리액션을 하지 않았다는 것. \n\n일부 네티즌은 \"스튜디오 분위기가 좀 별로다\", \"한혜진이 전현무의 말에 반응이 없다\", \"싸우면 리액션이 적어 진다고 하던데 싸운 것 아닌가\", \"결별한 것 같다\"는 등의 반응을 쏟아냈다.\n\n하지만 이와 반대로 다른 시청자들은 \"커플이 싸울 수도 있지 예민하게 볼 필요 없다\", \"결별설까지 제기하는 것은 말도 안 된다\", \"연애를 티 내도 지적하고, 자제해도 뭐라고 하면 두 사람은 어쩌란 말인가\"는 등의 의견을 내기도 했다.  ','i',9),(11,'sdffsdfds','dssdffdsfd','00','00',10),(12,'정지연','안녕하세요','안녕하세요!\r\n게시글 내용을 수정합니다.','0000',12),(13,'홍길동','답글','게시글에 대한 답변입니다.','0000',12),(14,'터보','나 어릴적 꿈','워 워워워 워워워- \r\n너를 나만에 여자로 만들겠다는 꿈이 생긴거야 \r\n어떤 어려움이 있더라도 이룰꺼야 \r\nRap 늘 내가 키워왔던 소중했던 내꿈은 \r\n우리 아빠가 좋아하던 대통령 \r\n음 그 꿈이 나와같은 친구 있었지만 난 좋아 \r\n꿈이 대통령이었다는게 나에 꿈을 위해 공부 많이많이 했지 \r\n대통령 사진까지 걸어놨지. 그런 내가 너를 처음 본순간 \r\n내 꿈은 확--- 바뀌었어 \r\n* 처음 너를 보는 순간 나는 알게 됐지. \r\n내가 찾던 꿈이라는 걸 \r\n처음 널 본 그 느낌이 나에 모든 것을 바꾸기에 충분했었지 \r\nSong 이젠 나에게 주어진 새로운 꿈만 간직하고 싶어 \r\n너를 위해서만 몰두하며 살아가고 싶어 \r\n너를 나만에 여자로 만들겠다는 꿈이 생긴거야 \r\n어떤 어려움이 있더라도 이룰거야, 이룰거야!\r\nRap 정말 이제 나는 포기했어. \r\n내가 대통령이 되려했던 그꿈을 온국민을 책임지는 \r\n것보단 한여자를 책임지는 남자이고 싶어 \r\n그래 이런 나를 싱겁다고 생각하지마. 이여자는 그만큼에 \r\n가치가 있어. 여잔 대단하긴 대단한가봐. \r\n확∼ 꿈이 바뀌었으니까','0000',14),(16,'공학윤리','공학법제','<생명공학윤리 사례>\r\nE(독일 자동차 회사 삼사의 후원을 받는 연구기관)는 디젤 승용차의 배출가스가 인체에 위험하지 않다는 점을 정부와 소비자에게 홍보하기 위하여 원숭이를 사용한 실험을 L(미국의 민간 의학연구소)에게 의뢰하였다. 실험을 의뢰 받은 L은 원숭이들을 특수유리로 만든 밀폐실에 가둬 놓고 매일 4시간 동안 디젤 자동차의 배출가스를 맡게 한 후 오전과 오후 총 3회 특수내시경을 코와 입을 통해 호흡기관 등에 넣어 혈액 등을 채취하는 실험을 실시하였다.\r\n이 사례에서 원숭이를 대상으로 실시된 임상시험은 윤리적으로 어떤 문제가 있는가?\r\n이 사례와 관련된 윤리의 내용으로는 “과학적 결과는 생태적 훼손을 야기해서는 안된다. 동물복지. 생명존중 사상”등이 있다.\r\n이러한 생명윤리에 따라 동물실험은 이를 대체할 수 있는 다른 실험방법이 없을 경우에 한하여 예외적으로 허용될 수 있지만 , 그 경우에도 실험동물의 개체수와 고통을 최소화 할 수 있는 시험방법을 사용하여야 한다.(3R원칙 : Replacement, Refinement, Reduction) 이에 비춰보면 사례의 연구소가 시행한 실험은 실험시간이나 실험방법의 측면에서 과도한 것으로 볼 수 있으므로 생명윤리에 반한다고 하겠다.\r\n이처럼 ‘인간을 위해 동물을 희생하는 것이 윤리적으로 허용되는가’의 문제로 인하여 국·내외에서는 아예 동물을 사용하지 않거나 동물 수를 줄이거나 고통을 줄이는 ‘동물대체시험법’이 시행됨.\r\n불가피하게 동물실험을 하여야 할 경우라면 먼저 ‘동물실험윤리위원회’의 심의를 신청하여 그 결과에 따르는 것이 바람직함. – 동물보호법 / 실험동물에 관한 법률\r\n\r\n<기업윤리 사례1>\r\n가습기 살균제를 개발하면서 그 제품에 사용된 원료가 인체에 치명적인 위험을 줄 수 있다는 사실을 알면서도 이를 중지하지 않고 생산·판매해 이로인해 인적피해가 발생. 이 사건으로 제조사는 손해배상책임과 형사 책임을 지게 되었고, 정부는 가습기 살균제 피해자를 지원하기 위한 ‘가습기살균체 피해구제를 위한 특별법’제정.\r\n직업의무 수행시 국민 안전·건강·복지에 최고 가치를 부여한다.\r\n공학자는 항상 대중 안전·건강·재산·복지를 보호하는 것을 우선적 의무로 인식한다.\r\n대중들의 안전·보건·복지에 부합하는 공학적 결정을 하는 책임을 수락하며 대중 또는 환경에 해로운 요인들을 즉시 공개한다.\r\n이에 따라 제조사는 가습기 살균제를 개발하는 과정에서 인체에 치명적인 위험을 줄 수 있는 원료 대신 안전한 원료를 사용하여야 했다. 이 사례의 경우처럼 제품의 용도가 직접 인체의 안전과 관련 있는 경우에는 인체의 안전을 가장 중요한 최우선의 가치로 판단하여 제품을 개발했어야 함.\r\n','0000',16),(17,'지연','웹프로그래밍','웹프로그래밍 수업 프로젝트 입니다.','0000',16);
/*!40000 ALTER TABLE `pjboard_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-09 16:36:44
