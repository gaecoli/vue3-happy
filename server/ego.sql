-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2022-12-21 07:29:55
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ego`
--

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` text,
  `cid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `name`, `cid`, `type`) VALUES
(1, '新鲜水果', 1001, 1),
(2, '海鲜水产', 1002, 1),
(3, '精选肉类', 1003, 1),
(4, '冷饮冻食', 1004, 1),
(5, '蔬菜单品', 1005, 1),
(6, '热销水果', 10001, 1001),
(7, '时令水果', 10002, 1001),
(8, '热带水果', 10003, 1001),
(9, '鱼类', 10021, 1002),
(10, '虾类', 10022, 1002),
(11, '蟹类', 10023, 1002),
(12, '贝类', 10024, 1002),
(13, '海参', 10025, 1002),
(14, '猪肉', 10031, 1003),
(15, '牛肉', 10032, 1003),
(16, '羊肉', 10033, 1003),
(17, '鸡肉', 10034, 1003),
(18, '鸭肉', 10035, 1003),
(19, '面点', 10041, 1004),
(20, '方便速食', 10051, 1004),
(21, '饮品甜品', 10052, 1004),
(22, '火锅丸料', 10053, 1004),
(23, '叶菜类', 10054, 1005),
(24, '鲜菇类', 10055, 1005),
(25, '根茎类', 10056, 1005),
(26, '新品蛋类', 10057, 1005),
(30, '灌灌灌灌', 1076, 4061),
(52, '元旦快乐', 1670227441, 1),
(53, '你快乐', 1670227448, 1670227441);

-- --------------------------------------------------------

--
-- 表的结构 `collect`
--

CREATE TABLE `collect` (
  `id` int(11) NOT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `phone` char(100) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `totalPrice` int(11) DEFAULT NULL,
  `ids` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `collect`
--

INSERT INTO `collect` (`id`, `orderNum`, `operator`, `phone`, `time`, `totalPrice`, `ids`) VALUES
(20, 67908, '张三', '15186553061', '2022-12-21 10:01:34', 230, '14,13'),
(21, 888278, '张三', '15174047474', '2022-12-21 10:01:38', 320, '12,11');

-- --------------------------------------------------------

--
-- 表的结构 `content`
--

CREATE TABLE `content` (
  `id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `content`
--

INSERT INTO `content` (`id`, `name`, `pid`) VALUES
(1001, 'banner广告', 10001),
(1003, '电子产品广告', 10003),
(19412, '刚刚赚了很多钱', 89602),
(1004, '京东618', 90410),
(90410, '电脑', 56320),
(1, '广告分类', 1001),
(10001, '侧边广告', 8020),
(10001, 'bbb', 1529),
(10001, 'cc', 474),
(10002, 'bbb', 9196),
(10001, 'nnn', 280),
(10002, '冲冲冲', 2999),
(1001, '2021京东618', 100),
(10001, '5555', 8359),
(100, '2022', 3927),
(100, 'eee', 3840),
(10001, '444', 9797),
(1001, '你好世界', 3064),
(757, 'fff', 6596),
(1001, '元旦快乐', 1891);

-- --------------------------------------------------------

--
-- 表的结构 `contentinfo`
--

CREATE TABLE `contentinfo` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` text NOT NULL,
  `url` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `contentinfo`
--

INSERT INTO `contentinfo` (`id`, `pid`, `name`, `url`, `image`) VALUES
(1, 10001, 'OPPO Watch', 'https://pro.jd.com/mall/active/tG3nBBhghqhfM69HoJw9ZoDaT7d/index.html?extension_id=eyJhZCI6IiIsImNoIjoiIiwic2hvcCI6IiIsInNrdSI6IiIsInRzIjoiIiwidW5pcWlkIjoie1wiY2xpY2tfaWRcIjpcIjg5YzRjMTUyLWUwZjktNGQ0OC05NDI4LTJhODQ4NWJjNTc1N1wiLFwibWF0ZXJpYWxfaWRcIjpcIjE4NTAxMDcyMjlcIixcInBvc19pZFwiOlwiNDI3MlwiLFwic2lkXCI6XCJmODcwZmM2MS1jYjc3LTQwN2UtOTM1ZC1jYzhlZTc0MTYyZTdcIn0ifQ==&jd_pop=89c4c152-e0f9-4d48-9428-2a8485bc5757&abt=1', '//img14.360buyimg.com/pop/s1180x940_jfs/t1/110562/14/10737/42247/5e81bb76E6fffa006/b3f703f750bd37ea.jpg.webp'),
(3, 90410, '椅子', 'https://channel-m.jd.com/pc/psp/10979325649?imup=CgwKBnd3dGxpdRIAGAASEAjR7azzKBDmZhoAIJpNKAEYsRsgACoUaWwsdWEseGdiLGdhLGNpYSxiYWEyAmlsOioKCWpkX2hiZHl5MRDnYRgCIJL50ty1x-S1dyjCo6Q3MMGjpDc4E0CAgCA&extension_id=eyJhZCI6IiIsImNoIjoiIiwic2hvcCI6IiIsInNrdSI6IiIsInRzIjoiIiwidW5pcWlkIjoie1wiY2xpY2tfaWRcIjpcIjJiNmEyNjE5LWE4MmItNGMyNi1iYzYwLWI3ZGE1NzljOWRkZVwiLFwibWF0ZXJpYWxfaWRcIjpcIjg2MDUxMzIyOTY2NTg2NjQ1OTRcIixcInBvc19pZFwiOlwiMzUwNVwiLFwic2lkXCI6XCJmN2Y5ODM2ZS0yZTViLTQyMTUtYWNiMi04NDdmZmI2N2U2ZDdcIn0ifQ==&jd_pop=2b6a2619-a82b-4c26-bc60-b7da579c9dde&abt=0', 'https://img12.360buyimg.com/pop/s1180x940_jfs/t1/117573/18/9029/83238/5ed7c92aE789977c2/b11a288a7284cdfe.jpg.webp'),
(5, 10002, 'fggh', 'dffg', 'dfdf'),
(6, 10002, 'hhh', 'hh', 'hh'),
(7, 10002, 'hhh', 'hh', 'hhh'),
(8, 10002, 'hhh', 'hh', 'hh'),
(9, 10002, 'aaa', 'aa', 'aaa'),
(11, 10001, '轮播图', 'http://www.baidu.com', 'http://www.baidu.com/banner.jpg'),
(12, 10001, '轮播图', 'http://www.baidu.com', 'http://www.baidu.com/banner.jpg'),
(13, 10001, 'hjh', '6666', '666');

-- --------------------------------------------------------

--
-- 表的结构 `orderinfo`
--

CREATE TABLE `orderinfo` (
  `id` int(11) NOT NULL,
  `code` text,
  `ordername` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL COMMENT '公司',
  `phone` text,
  `yudingTime` datetime DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `huizongStatus` int(11) DEFAULT NULL COMMENT '1未汇总 2 已汇总'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `orderinfo`
--

INSERT INTO `orderinfo` (`id`, `code`, `ordername`, `company`, `phone`, `yudingTime`, `price`, `huizongStatus`) VALUES
(4, '58568667', '王小虎', '抖音', '15147483647', '2022-11-15 19:45:48', '100', 1),
(5, '2147483647', '赵吴', '尚学堂', '15174836475', '2022-11-23 19:51:49', '200', 1),
(6, '2147483647', '小岳岳', '德云社', '13147483647', '2022-11-24 19:52:19', '100', 1),
(7, '567889990', '三毛', '流浪地球', '15174836479', '2022-11-29 19:22:04', '300', 1),
(8, '53423344', '沈腾', '开心麻花', '13717483647', '2022-11-30 09:47:44', '400', 1),
(9, '4455677', '贾玲', '大碗娱乐', '13114748367', '2022-11-30 09:48:16', '100', 1),
(10, '566778788', '宋小宝', '东北', '13566785327', '2022-11-30 09:48:48', '120', 1),
(11, '45566677', '钢铁侠', '复仇者联盟', '15147483647', '2022-11-24 09:50:16', '150', 2),
(12, '2147483647', '蜘蛛侠', '复仇者联盟', '15147483647', '2022-11-24 09:50:45', '170', 2),
(13, '2147483647', '黑寡妇', '复仇者联盟', '13514743647', '2022-11-17 09:51:19', '130', 2),
(14, '237905422', '任何', '尚学堂', '13146783228', '2022-11-26 09:51:50', '100', 2),
(15, '2147483647', '小胖梅', '尚学堂', '15474836477', '2022-11-29 09:52:18', '200', 2),
(16, '179843215', '郭麒麟', '德云社', '16266374604336', '2022-12-08 00:00:00', '230', 2),
(17, '1234567891234567', '测试数据', '测试公司', '1234579987653', '2022-12-15 00:00:00', '230', 1);

-- --------------------------------------------------------

--
-- 表的结构 `params`
--

CREATE TABLE `params` (
  `id` int(11) NOT NULL,
  `itemCatId` text NOT NULL,
  `paramData` text NOT NULL,
  `specsName` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `params`
--

INSERT INTO `params` (`id`, `itemCatId`, `paramData`, `specsName`) VALUES
(10027, '10003', '[{"value":"","title":"外观","children":[{"value":"","title":"体重"}]}]', '外设产品'),
(10031, '10002', '[{"value":"","title":"基本参数","children":[{"value":"","title":"外观"},{"value":"","title":"重量"},{"value":"","title":"生产时期"}]},{"value":"","title":"形状","children":[{"value":"","title":"耗电量"}]}]', '空调'),
(10032, '10003', '[{"value":"","title":"基本信息","children":[{"value":"","title":"体重"}]}]', '外设产品'),
(10033, '1004', '[{"value":"","title":"材料","children":[{"value":"","title":"纯棉"},{"value":"","title":"蕾丝"}]}]', '家具/家居'),
(10036, '10004', '[{"value":"","title":"多少度","children":[]}]', '摄像'),
(10037, '1004', '[{"value":"","title":"方法","children":[{"value":"","title":"热"}]}]', '家具/家居'),
(10044, '1003', '[{"value":"","title":"基本信息","children":[{"value":"","title":"外观"}]},{"value":"","title":"特殊配置","children":[{"value":"","title":"内存"}]}]', '电脑/办公'),
(10045, '1001', '[{"value":"","title":"dsds","children":[{"value":"","title":"dff"}]}]', '家用电器'),
(10046, '1002', '[{"value":"","title":"基本信息","children":[{"value":"","title":"参数"}]}]', '手机/运营商/数码'),
(10047, '1003', '[{"value":"","title":"过分过分过分","children":[{"value":"","title":"55人"}]}]', '电脑/办公'),
(10049, '1002', '[{"value":"","title":"配置参数","children":[{"value":"","title":"外观"}]}]', '手机/运营商/数码'),
(10051, '1001', '[{"value":"","title":"配置","children":[{"value":"","title":"111"}]}]', '家用电器'),
(10052, '10004', '[{"value":"","title":"配置","children":[{"value":"","title":"111"}]}]', '摄像'),
(10053, '1004', '[{"value":"","title":"家具","children":[{"value":"","title":"床"}]}]', '家具/家居'),
(10059, '10004', '[{"value":"","name":"基本信息","children":[{"value":"","name":"材料组成"},{"value":"","name":"使用寿命"}]}]', '冰箱'),
(10060, '10001', '[{"value":"","title":"手机配置","children":[{"value":"","title":"尺寸"},{"value":"","title":"像素"},{"value":"","title":"内存"}]}]', '手机通讯'),
(10061, '1001', '[{"value":"","title":"外观","children":[{"value":"","title":"高度"},{"value":"","title":"重量"}]}]', '家用电器'),
(10062, '10004', '[{"value":"","title":"66","children":[{"value":"","title":"666"}]}]', '冰箱');

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `image` text NOT NULL,
  `sellPoint` text NOT NULL,
  `price` text NOT NULL,
  `cid` text NOT NULL,
  `category` text,
  `num` text NOT NULL,
  `barcode` text NOT NULL,
  `status` text NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` text NOT NULL,
  `descs` text NOT NULL,
  `paramsInfo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`id`, `title`, `image`, `sellPoint`, `price`, `cid`, `category`, `num`, `barcode`, `status`, `create_time`, `updated`, `descs`, `paramsInfo`) VALUES
(10015, '三体-刘慈欣', '', '未来科幻', '99', '', NULL, '999', '', '', '0000-00-00 00:00:00', '', '<p>这是大刘的得意之作，连奥巴马都喜欢看！</p>', NULL),
(10028, '梦里花落知多少', '2.jpg', '小时代！！！', '11', '10001', NULL, '11', '', '', '0000-00-00 00:00:00', '', '<p>还不错，但是要看书籍，不要看电影</p>', NULL),
(10031, '我与地坛', '', '做一个不动声色的人', '55', '', NULL, '464', '', '', '0000-00-00 00:00:00', '', '人生尔尔，错过了，就是一辈子', NULL),
(10032, '舞！舞！舞！', '', '村上春树经典作品', '234', '43', NULL, '34', '', '', '0000-00-00 00:00:00', '', '人不是慢慢变老的，而是一瞬间变老的', NULL),
(10033, '岁月神偷', '', '经典书籍', '23', '', NULL, '23', '', '', '0000-00-00 00:00:00', '', '我没有精力去认识一个新的人，或者花力气去宠福新维系一段感情，跟没办法在把自己的故事讲述一遍又一遍', NULL),
(10035, '解忧杂货店', '', '无论现在有多么的不开心，你要相信明天会比今天更好', '34', '', NULL, '12', '', '', '0000-00-00 00:00:00', '', '<p>无论现在有多么的不开心，你要相信明天会比今天更好!!!!</p>', NULL),
(10038, '小王子', '', '写给成年人的童话故事', '20', '', NULL, '1', '', '1', '0000-00-00 00:00:00', '', '所有人都曾是小孩，虽然之后少数人记得', NULL),
(10039, '笑场', 'mock\\upload\\1585277506405-u=2137641711,889921437&fm=26&gp=0.jpg', '李诞的作品，很有意思，集成了扯经', '55', '100002', NULL, '1000', '', '1', '0000-00-00 00:00:00', '', '<p>未曾开言，我先笑场，笑过之后，听我来诉一诉衷肠</p>', NULL),
(10040, '万历十五年', 'mock\\upload\\1585277681739-u=2137641711,889921437&fm=26&gp=0.jpg', '人民的名义里面出现过很多次', '45', '10002', NULL, '26', '', '1', '0000-00-00 00:00:00', '', '<p>在明朝当皇帝其实没那么幸福，比其清朝来说，还是清朝的皇帝牛逼，毕竟清朝才是更加牛逼的中央集权制</p>', NULL),
(10084, '666', '', '666', '666', '', '', '666', '', '1', '0000-00-00 00:00:00', '', '<p>666</p>', NULL),
(10085, '888', '', '88', '888', '', '', '888', '', '1', '0000-00-00 00:00:00', '', '<p>888</p>', NULL),
(10088, '888', '', '888', '88', '', '', '888', '', '1', '0000-00-00 00:00:00', '', '<p>8888</p>', NULL),
(10089, '999', '', '99', '999', '', '', '99', '', '1', '0000-00-00 00:00:00', '', '<p>999</p>', NULL),
(10092, 'ioii', '', 'hhh', 'hhh', '', '', 'hhhh', '', '1', '0000-00-00 00:00:00', '', '<p>hhh</p>', NULL),
(10093, 'jjj', '', 'jjj', 'jjj', '10001', '电视', 'jjj', '', '1', '0000-00-00 00:00:00', '', '<p>jjj</p>', NULL),
(10094, '666', '', '66', '66', '10001', '电视', '66', '', '1', '0000-00-00 00:00:00', '', '<p>66</p>', NULL),
(10095, '444', '', '44', '444', '10001', '电视', '444', '', '1', '0000-00-00 00:00:00', '', '<p>4444</p>', '[{"value":"","name":"基本参数","children":[{"value":"44","name":"电视大小"},{"value":"44","name":"尺寸单位"}]}]'),
(10096, '777', '', '777', '77', '', '电视', '77', '', '1', '0000-00-00 00:00:00', '', '<p>777</p>', '[{"value":"","name":"基本参数","children":[{"value":"77666","name":"电视大小"},{"value":"77677","name":"尺寸单位"}]}]'),
(10097, '888', 'http://localhost:3065/upload/1616920627783-QQ图片20200722115959.jpg', '', '88', '', '', '8', '', '1', '0000-00-00 00:00:00', '', '', '[]'),
(10098, 'hhh', 'http://localhost:3065/1616921161534-QQ图片20200722115959.jpg', '', 'hh', '', '', 'hhh', '', '1', '0000-00-00 00:00:00', '', '', '[]'),
(10099, '', '', '', '', '', '', '', '', '1', '0000-00-00 00:00:00', '', '', ''),
(10100, '', '', '', '', '', '', '', '', '1', '0000-00-00 00:00:00', '', '', ''),
(10102, 'ggg', '', '44', '54', '', '', '45', '', '1', '0000-00-00 00:00:00', '', '', ''),
(10107, '电视长虹', 'http://localhost:4000/1617103475898-qq.jpg', '111', '111', '10001', '电视', '223', '', '1', '0000-00-00 00:00:00', '', '<p>4444最好的电视</p>', ''),
(10108, '家具用品', 'http://localhost:4000/1617103894235-qq.jpg', 'www', '12.00', '1004', '家具/家居', '3445', '', '1', '0000-00-00 00:00:00', '', '<p>哈哈哈，看看怎么样吧，测试数据</p>', ''),
(10112, '游戏光盘', 'http://localhost:4000/1617104395957-qq.jpg', '1323', '45.34', '10004', '游戏设备', '3455', '', '1', '0000-00-00 00:00:00', '', '<p>目前加入的prop 那么神奇吗</p>', ''),
(10117, '天高任鸟飞，海阔凭鱼跃', '', '心敢比天高', '1200.00', '', '', '1', '', '1', '0000-00-00 00:00:00', '', '<p>越自律越优秀</p>', ''),
(10121, '灌灌灌灌', 'http://localhost:3000/1617242837899-qq.jpg', '455', '455', '10002', '家纺', '455', '', '1', '0000-00-00 00:00:00', '', '<p>4555</p>', ''),
(10138, '对对对', '', '11', '11', '1003', '电脑/办公', '11', '', '1', '0000-00-00 00:00:00', '', '<p>111</p>', '[{"value":"22","title":"基本信息","children":[{"value":"22","title":"外观"}]},{"value":"22","title":"特殊配置","children":[{"value":"22","title":"内存"}]}]'),
(10142, '555', '55', '55', '', '', NULL, '', '', '', '0000-00-00 00:00:00', '', '', NULL),
(10153, '66', '', '66', '66', '', '', '66', '', '1', '0000-00-00 00:00:00', '', '<p>66</p>', '[]'),
(10155, '888', '', '88', '888', '', '', '88', '', '', '2022-11-29 16:17:11', '', '<p>88</p>', '[]'),
(10161, '66', '["http://localhost:9898/1669799429884-1.png","http://localhost:9898/1669799429881-2.png"]', '66', '66', '10001', '热销水果', '66', '', '', '2022-11-30 17:10:35', '', '<p>6789</p>', ''),
(10165, '99988', '["http://localhost:9898/1669873911112-mid.png"]', '99', '9988', '10033', '羊肉', '9988', '', '', '2022-12-01 13:52:12', '', '<p>9999888</p>', ''),
(10166, '香菇', '[]', '不一样的香菇', '7.8', '10055', '鲜菇类', '12', '', '', '2022-12-01 16:08:50', '', '<p>香菇很嫩</p><p><strong>好吃</strong></p><h4><strong>真神奇</strong></h4><p><br></p>', ''),
(10167, '666', '["http://localhost:9898/1669949290388-4.png"]', '666', '666', '1001', '新鲜水果', '666', '', '', '2022-12-02 10:49:59', '', '<p>灌灌灌灌[图片][图片]</p>', ''),
(10168, '666', '["http://localhost:9898/1669949519338-1.png"]', '666777', '666676767', '1004', '冷饮冻食', '666', '', '', '2022-12-02 11:14:50', '', '<p>哈哈哈<img src="http://localhost:9898/1669949525190-mid.png" alt="" data-href="upload\\1669949525190-mid.png" style=""/></p>', ''),
(10174, '2222', '[]', '222', '222', '1004', '冷饮冻食', '22', '', '', '2022-12-19 16:03:29', '', 'hello2222', ''),
(10175, '888', '[]', '88', '88', '1670227441', '元旦快乐', '88', '', '', '2022-12-19 16:03:56', '', 'hello888', ''),
(10187, '777', '["http://localhost:6688/1671502567824-1.png","http://localhost:6688/1671502684932-3.png"]', '777', '777', '1003', '精选肉类', '777', '', '', '2022-12-20 10:18:48', '', 'hello77779999', '');

-- --------------------------------------------------------

--
-- 表的结构 `projectparams`
--

CREATE TABLE `projectparams` (
  `id` int(11) NOT NULL,
  `productId` text NOT NULL,
  `paramscontent` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `totalorder`
--

CREATE TABLE `totalorder` (
  `id` int(11) NOT NULL,
  `totalcode` int(11) DEFAULT NULL,
  `totalname` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `totalTime` datetime DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `huizongStatus` int(11) DEFAULT NULL,
  `xiadanname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `userinfo`
--

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `userinfo`
--

INSERT INTO `userinfo` (`id`, `username`, `password`) VALUES
(1, 'admin', '123'),
(2, 'ime', '123'),
(3, 'jack', '123'),
(4, 'sakura', '123'),
(5, '张三', '123'),
(6, '李四', '123'),
(7, 'hello1', '123123'),
(8, 'hello2', '123'),
(9, 'qq', '123'),
(10, 'QQ', '123'),
(11, 'QQ', '123'),
(12, 'ww', '123'),
(13, 'www', '123'),
(14, 'eee', 'eee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collect`
--
ALTER TABLE `collect`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contentinfo`
--
ALTER TABLE `contentinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderinfo`
--
ALTER TABLE `orderinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `params`
--
ALTER TABLE `params`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projectparams`
--
ALTER TABLE `projectparams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `totalorder`
--
ALTER TABLE `totalorder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- 使用表AUTO_INCREMENT `collect`
--
ALTER TABLE `collect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- 使用表AUTO_INCREMENT `contentinfo`
--
ALTER TABLE `contentinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `orderinfo`
--
ALTER TABLE `orderinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `params`
--
ALTER TABLE `params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10063;
--
-- 使用表AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10188;
--
-- 使用表AUTO_INCREMENT `projectparams`
--
ALTER TABLE `projectparams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `totalorder`
--
ALTER TABLE `totalorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
