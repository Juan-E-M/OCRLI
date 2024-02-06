-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 10.123.0.84:3306
-- Tiempo de generación: 25-01-2024 a las 14:08:50
-- Versión del servidor: 5.7.27
-- Versión de PHP: 7.0.33-0+deb9u12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `asertiva_ocrli`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autoevaluacion`
--

CREATE TABLE `autoevaluacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idPregunta` int(11) NOT NULL,
  `respuesta` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idRegistro` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

--
-- Volcado de datos para la tabla `autoevaluacion`
--

INSERT INTO `autoevaluacion` (`id`, `idPregunta`, `respuesta`, `idRegistro`, `created_at`, `updated_at`) VALUES
(1, 1, 'V', 1, NULL, NULL),
(2, 2, 'F', 1, NULL, NULL),
(3, 3, 'F', 1, NULL, NULL),
(4, 4, 'V', 1, NULL, NULL),
(5, 5, 'V', 1, NULL, NULL),
(6, 6, 'F', 1, NULL, NULL),
(7, 7, 'F', 1, NULL, NULL),
(8, 8, 'F', 1, NULL, NULL),
(9, 9, 'V', 1, NULL, NULL),
(10, 10, 'F', 1, NULL, NULL),
(11, 11, 'V', 1, NULL, NULL),
(12, 12, 'F', 1, NULL, NULL),
(13, 13, 'V', 1, NULL, NULL),
(14, 14, 'F', 1, NULL, NULL),
(15, 15, 'V', 1, NULL, NULL),
(16, 16, 'V', 1, NULL, NULL),
(17, 17, 'V', 1, NULL, NULL),
(18, 18, 'V', 1, NULL, NULL),
(19, 19, 'V', 1, NULL, NULL),
(20, 20, 'V', 1, NULL, NULL),
(21, 21, 'V', 1, NULL, NULL),
(22, 22, 'V', 1, NULL, NULL),
(23, 23, 'V', 1, NULL, NULL),
(24, 24, 'V', 1, NULL, NULL),
(25, 25, 'F', 1, NULL, NULL),
(26, 26, 'V', 1, NULL, NULL),
(27, 27, 'V', 1, NULL, NULL),
(28, 28, 'V', 1, NULL, NULL),
(29, 29, 'V', 1, NULL, NULL),
(30, 30, 'V', 1, NULL, NULL),
(31, 31, 'F', 1, NULL, NULL),
(32, 32, 'F', 1, NULL, NULL),
(33, 33, 'V', 1, NULL, NULL),
(34, 34, 'V', 1, NULL, NULL),
(35, 35, 'V', 1, NULL, NULL),
(36, 36, 'V', 1, NULL, NULL),
(37, 37, 'V', 1, NULL, NULL),
(38, 38, 'V', 1, NULL, NULL),
(39, 39, 'V', 1, NULL, NULL),
(40, 40, 'V', 1, NULL, NULL),
(41, 41, 'V', 1, NULL, NULL),
(42, 42, 'V', 1, NULL, NULL),
(43, 43, 'V', 1, NULL, NULL),
(44, 44, 'F', 1, NULL, NULL),
(45, 45, 'F', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brechas_planificacion`
--

CREATE TABLE `brechas_planificacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idDimension` int(11) NOT NULL,
  `idFactor` int(11) NOT NULL,
  `idEstandar` int(11) NOT NULL,
  `idCriterioEvaluacion` int(11) NOT NULL,
  `idMedioSugerido` int(11) NOT NULL,
  `medio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identificacionBrecha` int(11) NOT NULL,
  `brecha` double(8,2) NOT NULL,
  `idRegistro` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brecha_criterio`
--

CREATE TABLE `brecha_criterio` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idCriterio` int(11) NOT NULL,
  `idNivelBrecha` int(11) NOT NULL,
  `idRegistro` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

--
-- Volcado de datos para la tabla `brecha_criterio`
--

INSERT INTO `brecha_criterio` (`id`, `idCriterio`, `idNivelBrecha`, `idRegistro`, `created_at`, `updated_at`) VALUES
(1, 0, 3, 2, NULL, '2022-12-19 03:48:50'),
(2, 0, 2, 4, NULL, NULL),
(3, 0, 1, 1, NULL, '2024-01-24 04:53:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criterio`
--

CREATE TABLE `criterio` (
  `id` int(11) NOT NULL,
  `detalle` text COLLATE utf8_unicode_ci NOT NULL,
  `id_estandar` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `criterio`
--

INSERT INTO `criterio` (`id`, `detalle`, `id_estandar`) VALUES
(1, '1.1.1.La universidad o escuela de posgrado implementa un modelo educativo que define su propuesta filosófica, humanística, científica, tecnológica y pedagógica respecto del proceso formativo integral del estudiante, y que sustenta el desarrollo de sus procesos vinculados a sus fines institucionales.', 1),
(2, '1.2.2 La universidad o escuela de posgrado cuenta con una estructura orgánica definida en instrumentos normativos y de gestión, así como con autoridades y miembros de los órganos de gobierno capaces de garantizar el cumplimiento de la Ley Universitaria y el desarrollo de sus funciones.', 2),
(3, '1.2.3 La universidad o escuela de posgrado cuenta con normas, principios, valores, y procedimientos que guían la conducta de toda la comunidad universitaria y que aseguran que la toma de decisiones en los órganos de gobierno y el ejercicio de la autoridad sea responsable y de acuerdo con principios y los fines establecidos en la Ley Universitaria.', 2),
(4, '1.3.4 La universidad o escuela de posgrado implementa instrumentos de planificación institucional vinculada a sus funciones y desarrolla procesos de evaluación y mejora de estos que involucran a distintos actores de la comunidad universitaria.', 3),
(5, '1.4.5 La universidad o escuela de posgrado implementa un plan de gestión de la calidad, elaborado en base a procesos de autoevaluación por parte de la comunidad universitaria de las Condiciones Básicas de Calidad que fueron verificadas en el primer procedimiento de Licenciamiento Institucional, que se encuentra alineado a sus objetivos institucionales y orientado hacia el desarrollo de un sistema de gestión de la calidad interna y la medición del impacto de su quehacer institucional', 4),
(6, '1.5.6 La universidad o escuela de posgrado cuenta con políticas, presupuestos, herramientas de gestión y control de recursos financieros que garanticen un manejo responsable, eficiente, transparente y sostenible de los mismos, alineados con sus objetivos institucionales.', 5),
(7, '1.5.7 La universidad o escuela de posgrado cuenta con una proyección económica y financiera sostenible, alineada con las prioridades y fines institucionales.', 5),
(8, '1.6.8 La universidad o escuela de posgrado cuenta con sistemas académicos y administrativos integrados para la recolección, revisión, análisis, sistematización, conservación y difusión de la información para la toma de decisiones y establecer acciones de mejora. Ello dentro de un marco normativo que orienta y promueve la transparencia y acceso a la información pública con observancia de las normas de protección de datos personales y de la seguridad de la información.', 6),
(9, '1.7.9 La universidad o escuela de posgrado cuenta con políticas y planes de redes interinstitucionales con otras instituciones de educación superior y otras instituciones del sector público y/o privado nacional y/o internacional, acorde a sus fines y planificación estratégica, que garanticen oportunidades de movilidad y colaboración para impulsar el desarrollo de actividades académicas, investigación, responsabilidad social, así como el vínculo con el sector productivo y social.', 7),
(10, '1.7.10 La universidad o escuela de posgrado cuenta con una política de internacionalización, acorde a sus fines y planificación estratégica, con el fin de lograr la colaboración con otras universidades extranjeras en actividades académicas, investigación, responsabilidad social.', 7),
(11, '1.8.11 Todos los locales de la universidad o escuela de posgrado (conducentes a grado académico, de servicios de bienestar y/o que vinculen a la comunidad universitaria) reúnen características generales para brindar el servicio educativo superior universitario. En este sentido, mantienen el derecho real de uso exclusivo, se adecúan a la normativa vigente, están expresamente diseñados para el fin de educación superior universitaria, cuentan con capacidad suficiente para atender a la comunidad universitaria; y mantienen la accesibilidad y disponibilidad de los servicios públicos de agua y desagüe, y energía eléctrica.', 8),
(12, '1.8.12 La universidad o escuela de posgrado evidencia la existencia y pertinencia, respecto de la oferta académica, de ambientes, equipamiento, software, recursos no presenciales y mobiliario empleados como recursos para el aprendizaje. Estos están vinculados a las actividades académicas, actividad docente, investigación, servicios de bienestar y responsabilidad social y aprendizaje extracurricular. (laboratorios de enseñanza, cómputo y de investigación, talleres, ambientes para docentes, aulas, bibliotecas, tópicos, salas de estudio con acceso a TICS, salas de trabajo para estudiantes, entre otros).', 8),
(13, '1.8.13 La universidad o escuela de posgrado cuenta con infraestructura y soporte tecnológicos (internet, telefonía, software y hardware) para el cumplimiento de sus funciones académicas, de investigación y administrativas, asegurando la conectividad de los recursos que se brinda en línea. Asimismo, planifica las actividades relacionadas a las tecnologías de la información orientándose hacia el uso sistemático y mejora continua de las mismas en sus diversos procesos.', 8),
(14, '1.8.14 Todos los locales de la universidad o escuela de posgrado (conducentes a grado académico y donde se brinden servicios de bienestar y/o que vinculen a la comunidad universitaria) proporcionan, a través de sistemas de gestión, condiciones de seguridad para la comunidad universitaria, a nivel de local, ambientes y recursos de enseñanza, así como condiciones de mantenimiento de la infraestructura, equipamiento y mobiliario.', 8),
(15, '1.9.15 La universidad o escuela de posgrado implementa acciones para el fortalecimiento de las capacidades del personal no docente.', 9),
(16, '1.10.16 La universidad o escuela de posgrado diseña e implementa su política de RSU, a través de sus procesos de formación, investigación, gestión estratégica y gestión institucional, así como su vinculación con el entorno, orientada a contribuir al desarrollo sostenible y al bienestar de la sociedad.', 10),
(17, '2.11.17 La universidad o escuela de posgrado cuenta con planes de estudio actualizados y alineados a su modelo educativo, que planifican, estructuran y definen de forma clara el proceso formativo de los estudiantes. Todos los programas han pasado por procesos de revisión, con participación de la comunidad académica y otros actores de interés, analizando y considerando los cambios que existen en los ámbitos económicos, sociales, culturales, científicos y tecnológicos, con el fin de continuar asegurando su relevancia y pertinencia. De ser el caso, los programas nuevos responden a estudios actualizados empíricos—oficiales, confiables y verificables— y teóricos, que justifican su relevancia y pertinencia económica, social, cultural, académica, científica y tecnológica en el área de influencia.', 11),
(18, '2.12.18 La universidad o escuela de posgrado cuenta con centros de información y referencia (biblioteca física, biblioteca virtual, hemerotecas, pinacotecas, colecciones artísticas y no artísticas, documentos históricos, u otro tipo de material documentario) en todos sus locales con acervo bibliográfico físicos y virtual, documentos y colecciones actualizados que son pertinentes con las áreas del conocimiento y/o programas académicos que oferta y cuenta con estrategias para su actualización y mejora continua.', 12),
(19, '2.12.19 La universidad o escuela de posgrado cuenta con sistema(s) de aprendizaje virtual que permiten alcanzar los objetivos y el desarrollo continuo de los cursos de programas, principalmente en la modalidad semipresenciales y/o a distancia.', 12),
(20, '2.13.20 La universidad o escuela de posgrado cuenta con una estrategia institucional para la formación académica de sus estudiantes en la admisión y permanencia, a fin de asegurar los logros de aprendizaje esperados.', 13),
(21, '2.14.21 La universidad o escuela de posgrado cumple con tener un 25%, como mínimo, de docentes con un régimen de dedicación a tiempo completo o dedicación exclusiva, quienes son preferentemente doctores, y ejercen distintos roles en las labores de docencia, investigación, gestión universitaria, asesoría académica, o proyección social, con una carga horaria que permite la dedicación a las mismas. En caso corresponda, este porcentaje debe cumplirse en cada sede y filial.', 14),
(22, '2.14.22 La universidad regula e implementa acciones para el desarrollo profesional, académico318 y pedagógico del personal docente, acorde con su oferta académica y perspectivas de desarrollo institucional.', 14),
(23, '2.14.23 La universidad o escuela de posgrado implementa procesos de fortalecimiento de la carrera docente320, de acuerdo con medios meritocráticos y una lógica de resultados, con fines de ingreso, nombramiento, promoción, renovación de contratos, ratificación y separación, orientados a la mejora de las competencias y condiciones del profesorado.', 14),
(24, '3.15.24 La universidad o escuela de posgrado cuenta con un cuerpo de docentes calificados y con experiencia para el desarrollo de la investigación, con categoría Renacyt, y son quienes lideran las líneas y grupos de investigación de la universidad. Estos representan al menos el 3% del total de docentes. Dicho cuerpo de docentes es fortalecido de forma institucional a través de la implementación de instrumentos normativos y de gestión. En caso tenga más de una sede o filial, el indicador aplica a cada una de estas. En caso cuente con programas de doctorado, se evidencia que cuenta con 7% del total de docentes con categoría Renacyt y al menos el 40% de los mismos son a tiempo completo.', 15),
(25, '3.16.25 La universidad o escuela de posgrado ha implementado su(s) documento(s) normativo(s), consistentes con la normativa aplicable de Concytec y actualizados que definen, orientan y promueven el desarrollo de la investigación (científica, innovación, creación artística y/o cultural) y la transferencia de conocimientos, garantizando los principios de calidad, integridad científica y libertad académica en la investigación. Los documentos han sido previamente evaluados por la universidad y han sido mejorados.', 16),
(26, '3.16.26 La universidad o escuela de posgrado implementa políticas, instrumentos de gestión y planificación para desarrollo, difusión y consolidación de la investigación, innovación, producción artística y/o cultural y/o transferencia de conocimientos, articulada con su modelo educativo, los objetivos y normativas institucionales y nacionales vigentes, que involucra tanto a docentes como estudiantes.', 16),
(27, '3.17.27 La universidad o escuela de posgrado desarrolla sus líneas de investigación dotándolas de recursos humanos, financieros, infraestructura y equipamiento necesarios para contribuir y generar resultados en los ámbitos local, nacional y/o internacional.', 17),
(28, '4.18.28 La universidad o escuela de posgrado ha implementado servicios complementarios que promueven y fortalecen la formación integral de sus estudiantes, para lo cual cuenta como mínimo con personal y documentos normativos que garanticen su adecuado desarrollo. Se incluye como mínimo, según corresponda, los siguientes servicios: i) tópico, ii) servicios de salud física y mental, iii) servicios psicopedagógicos, iv) actividades para la promoción del deporte, v) programas deportivos de alta competencia (PRODAC), vi) actividades artísticas o culturales, vii) tutoría y viii) becas y/o programas de asistencia universitaria.', 18),
(29, '4.18.29 La universidad diseña e implementa servicios orientados a la prevención de la deserción y a la promoción de la graduación, con especial énfasis en las necesidades de los grupos en situación de vulnerabilidad. *No aplica para Escuelas de Posgrado.', 18),
(30, '4.19.30 La universidad o escuela de posgrado cuenta con programas y/o proyectos de relación con la comunidad con enfoque socialmente responsable, los cuales buscar contribuir al desarrollo sostenible y al bienestar de la sociedad.', 19),
(31, '4.19.31 La universidad o escuela de posgrado diseña e implementa procedimientos para la protección del medioambiente y desarrollo sostenible.', 19),
(32, '4.20.32 La universidad o escuela de posgrado diseña e implementa procedimientos dirigidos a hacer seguimiento a la actividad laboral de sus egresados, así como estrategias para promover la inserción laboral.', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dimension`
--

CREATE TABLE `dimension` (
  `id` int(11) NOT NULL,
  `detalle` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejecucion_planificacion`
--

CREATE TABLE `ejecucion_planificacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idBrechaCriterio` int(11) NOT NULL,
  `actividad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `como` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaInicio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaFin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `donde` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requerimiento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hitoSeguimiento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entregableHito` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idRegistro` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_humano`
--

CREATE TABLE `equipo_humano` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombresApellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcionesPrincipales` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correoElectronico` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numeroCelular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idRegistro` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

--
-- Volcado de datos para la tabla `equipo_humano`
--

INSERT INTO `equipo_humano` (`id`, `nombresApellidos`, `cargo`, `funcionesPrincipales`, `correoElectronico`, `numeroCelular`, `idRegistro`, `created_at`, `updated_at`) VALUES
(1, 'Rodrigo', 'gg', 'gg', 'gg@oceanperu.com', '9999999999', 4, NULL, NULL),
(2, 'Equipo Urbano', 'Su cargo', 'Sus funciones principales', 'equipo@gmail.com', '989898090', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estandar`
--

CREATE TABLE `estandar` (
  `id` int(11) NOT NULL,
  `detalle` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `id_factor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estandar`
--

INSERT INTO `estandar` (`id`, `detalle`, `id_factor`) VALUES
(1, '1.1 Modelo Educativo', 1),
(2, '1.2 Gobierno', 1),
(3, '1.3 Planificación Institucional', 1),
(4, '1.4 Gestión de la calidad', 1),
(5, '1.5 Gestión económica y financiera', 1),
(6, '1.6 Gestión de la información', 1),
(7, '1.7 Redes interinstitucionales', 1),
(8, '1.8 Infraestructura física y tecnológica', 1),
(9, '1.9 Personal no docente', 1),
(10, '1.10 Responsabilidad Social Universitaria y su contribución al desarrollo sostenible', 1),
(11, '2.11 Planes de estudios', 2),
(12, '2.12 Recursos para el estudio y aprendizaje', 2),
(13, '2.13 Gestión de los procesos académicos', 2),
(14, '2.14 Docentes', 2),
(15, '3.15 Investigadores', 3),
(16, '3.16 Regulación, planificación y política de investigación, innovación, producción artística-cultural y transferencia de conocimientos.', 3),
(17, '3.17 Desarrollo de las líneas de investigación', 3),
(18, '4.18 Bienestar de la comunidad universitaria.', 4),
(19, '4.19 Relación con el entorno', 4),
(20, '4.20 Mecanismos de mediación e inserción laboral', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `resultado` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`id`, `pregunta`, `resultado`) VALUES
(1, 'La renovación del licenciamiento institucional es obligatoria por ley universitaria Nº 30220', 'V'),
(2, 'La renovación del licencimiento institucional es responsabilidad exclusiva de la oficina de calidad o quien haga sus veces', 'F'),
(3, 'Son 4 CBC, 20 componentes y 30 indicadores se evaluarán para la renovación de licencia institucional', 'F'),
(4, 'El modelo educativo de la universidad o escuela de posgrado sustenta el desarrollo de sus procesos vinculados a sus fines institucionales', 'V'),
(5, 'Para lograr un indicar se toma en cuenta que para ser autoridad de la universidad, se debe cumplir lo plasmado en la ley y en reglamento electoral', 'V'),
(6, 'Un indicador, señala que las resoluciones rectorales tienen sustento en la percepción de las autoridades', 'F'),
(7, 'El licenciamiento institucional no permitirá modificar instrumentos de planificación presentados', 'F'),
(8, 'La primera licencia institucional obliga a mantener los objetivos institucionales en la renovación de licenciamiento institucional', 'F'),
(9, 'Tener políticas presupuestales es obligatorio para el cumplimiento del indicador', 'V'),
(10, 'Si los indicadores financieros proyectados, no son favorbales, el indicador no afecta al componente', 'F'),
(11, 'Para renovar la licencia de una escuela de posgrado, se debe dar acceso a los sistemas académicos y administrativos de las personas', 'V'),
(12, 'El Plan para el desarrollo de redes interinstitucionales con un horizonte mínimo de dos (2) años y aprobado por la autoridad competente, es un indicador', 'F'),
(13, 'La Universidad debe tener una política de internacionalización para licenciar', 'V'),
(14, 'Los locales de la universidad deben tener base de datos a SCOPUS para que sea aceptado el componente', 'F'),
(15, 'Los laboratorios de la escuela de posgrado deben tener un listado del estado de sus equipos, para contribuir al logro de la CBC', 'V'),
(16, 'Conatr con un plan de mantenimiento de infraestructura, favorece el criterio de evaluación de la CBC GESTIÓN ESTRATÉGICA Y SOPORTE INSTITUCIONAL', 'V'),
(17, 'Los mobiiarios registrados serán evaluados en la CBC 1: GESTIÓN ESTRATÉGICA Y SOPORTE INSTITUCIONAL', 'V'),
(18, 'Un programa de capacitación semestral a docentes de la universidad faciita el logro de un indicador', 'V'),
(19, 'La política de RSU, debe incluir los ODS como parte de un medio de verificación', 'V'),
(20, 'Una metodología para el diseño de planes de estudio, puede ser considerado como un medio de verificación de un indicador de la CBC 2: DOCENCIA Y ENSEÑANZA-APRENDIZAJE', 'V'),
(21, 'Un tesauro, puede ser parte de un indicador', 'V'),
(22, 'Los LMS deben ser medios verificables si se desarrolla actividades virtuales', 'V'),
(23, 'El perfil de ingreso es base para una política de permanencia estudiantil', 'V'),
(24, 'EL Clasificación Internacional Normalizada de la Educación (CINE) es un documento de referencia que interviene en el Licenciamiento', 'V'),
(25, 'El mejoramiento continuo y permanente de la enseñanza, la proyección social y la gestión universitaria no se presenta en las horas lectivas de los docentes a tiempo completo', 'F'),
(26, 'La gestión de reclamos, quejas y denuncias es un medio de verificación de las escuelas de posgrado', 'V'),
(27, 'El proceso de admisión es un aspecto relevante en el aseguramiento de la calidad de los programas de doctorado', 'V'),
(28, 'Los componentes del modelo no se evalúan de forma aislada, sino de una forma integral', 'V'),
(29, 'Coherencia, es un criterio empleado en la evaluación de las CBC-R, componentes e indicadores', 'V'),
(30, 'Consistencia, es un criterio empleado en la evaluación de las CBC-R, componentes e indicadores', 'V'),
(31, 'Pertinencia, no es un criterio empleado en la evaluación de las CBC-R, componentes e indicadores', 'F'),
(32, 'Años de la funcionamiento de la Universidad, es un criterio empleado en la evaluación de las CBC-R, componentes e indicadores', 'F'),
(33, 'Sostenibilidad, es un criterio empleado en la evaluación de las CBC-R, componentes e indicadores', 'V'),
(34, 'Mejora continua, es un criterio empleado en la evaluación de las CBC-R, componentes e indicadores', 'V'),
(35, 'Razonabilidad, es un criterio empleado en la evaluación de las CBC-R, componentes e indicadores', 'V'),
(36, 'Tener una plataforma virtual de la bolsa de trabajo en portal web oficial disponible para los estudiantes y egresados de los programas de pregrado. Es un medio de verificación', 'V'),
(37, 'Un indicador de la universidad o escuela de posgrado es que tengan programas y/o proyectos de relación con la comunidad con enfoque socialmente responsable, los cuales buscar contribuir al desarrollo sostenible y al bienestar de la sociedad', 'V'),
(38, 'Un indicador de la universidad o escuela de posgrado es el diseño e implementación de procedimientos dirigidos a hacer seguimiento a la actividad laboral de sus egresados, así como estrategias para promover la inserción laboral', 'V'),
(39, 'La universidad o escuela de posgrado puede agrupar los protocolos de seguridad actualizados de los laboratorios y talleres de acuerdo con la tipología de ambientes', 'V'),
(40, 'Planos de seguridad señalización, evacuación y mapa de riesgos vigente, que incluya los puntos de acopio y/o almacenamiento de residuos comunes, sólidos - líquidos peligrosos y/o RAEEs, según corresponda, actualizados y elaborados por un profesional ', 'V'),
(41, 'Los Planos de Ubicación y Arquitectura actualizados de todos los locales conducentes a grado académico, suscritos y elaborados por un profesional responsable, serán solicitados previa realización de verificaciones presenciales físicas o remotas', 'V'),
(42, 'El formato de renovación de licencia R-C8, especifica los ambientes para docentes, así como el equipamiento, software, recursos no presenciales y mobiliario disponibles', 'V'),
(43, 'El formato de Renovación de Licencia R-C6, especifica cada laboratorio de enseñanza, cómputo y de investigación, y talleres', 'V'),
(44, 'El formato de Renovación de Licencia R-A2, contiene el listado de todos los locales que forman parte del patrimonio de la universidad o escuela de posgrado', 'V'),
(45, 'Los componenetes: Modelo Educativo, Gobierno, Planificación Institucional y Gestión de la calidad son los más importantes en el proceso de renovación', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factor`
--

CREATE TABLE `factor` (
  `id` int(11) NOT NULL,
  `detalle` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_dimension` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `factor`
--

INSERT INTO `factor` (`id`, `detalle`, `id_dimension`) VALUES
(1, '1. GESTIÓN ESTRATÉGICA Y SOPORTE INSTITUCIONAL', 1),
(2, '2. DOCENCIA Y ENSEÑANZA-APRENDIZAJE', 1),
(3, '3. INVESTIGACIÓN, INNOVACIÓN Y PRODUCCIÓN ARTÍSTICA-CULTURAL', 1),
(4, '4. RELACIÓN CON LA COMUNIDAD UNIVERSITARIA Y EL ENTORNO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medio`
--

CREATE TABLE `medio` (
  `id` int(11) NOT NULL,
  `detalle` text NOT NULL,
  `id_criterio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `medio`
--

INSERT INTO `medio` (`id`, `detalle`, `id_criterio`) VALUES
(0, '1.1.1.1 Modelo Educativo de la universidad o escuela de posgrado, aprobado por autoridad competente. Contiene, como mínimo, lo siguiente:\r\n(i) Conceptualización y justificación de su propuesta filosófica, humanística, ética, científica, tecnológica y pedagógica respecto del proceso formativo integral del estudiante, incluyendo descripción del contexto social, cultural y productivo en el que se sitúa.\r\n(ii) Descripción y justificación de la organización de los estudios (niveles de enseñanza y modalidades de estudio), así como la diferenciación entre formación específica y de especialidad,\r\n(iii) Conceptualización y desarrollo de su propuesta respecto a la investigación, responsabilidad social, formación en ciudadanía, desarrollo sostenible, interculturalidad, inclusión, género, entre otros,\r\n(iv) Definición de los actores que conforman la comunidad educativa (perfil de estudiantes, egresados y docentes),\r\n*Si la universidad tiene varias sedes y/o filiales deberá demostrar cómo éstas se integran en el modelo educativo.\r\n**Si la universidad cuenta con programas en modalidad semipresencial y/o a distancia, su Modelo Educativo, además:\r\n(v) Desarrolla las características de su propuesta formativa en entornos no presenciales de aprendizaje.\r\n(vi) Desarrolla una estrategia para que los estudiantes gocen de una integración en la vida universitaria, la construcción de identidad como universitarios y el uso de los servicios de bienestar (mínimamente a nivel pregrado).', 1),
(0, '1.2.2.2 Estatuto o Reglamento General o norma equivalente, donde se establezcan los fines, principios, valores, así como las autoridades y órganos de gobierno, con participación de la comunidad universitaria mínimamente en aquellos que ejercen funciones académicas, y la Defensoría Universitaria; de acuerdo con la Ley Universitaria y la normativa vigente. En el caso de las universidades públicas, establece también el Tribunal de Honor y la Comisión Permanente de Fiscalización.', 2),
(0, '1.2.2.3 Reglamento de Organización y Funciones (ROF) y/o Manual de Organización y Funciones (MOF) o el que haga de sus veces, aprobado por la autoridad competente, donde se definan las funciones de los órganos, unidades orgánicas y autoridades encargadas de la gestión de la universidad o escuela de posgrado y de la gestión académica de los programas de pregrado, posgrado y segunda especialidad, según corresponda.\r\n*En caso la universidad o escuela de posgrado cuente con filiales, se define la estructura orgánica y autoridades en estas y su relación con los órganos, unidades orgánicas y autoridades de la sede.', 2),
(0, '1.2.2.4 Organigrama institucional o el que haga de sus veces, aprobado por la autoridad competente, donde se evidencie la estructura orgánica de la universidad o escuela de posgrado.\r\n*En caso la universidad o escuela de posgrado cuente con filiales, se incluye la estructura de estas y su vinculación con la estructura institucional', 2),
(0, '1.2.2.5 Formato de Renovación de Licencia R-C12 de declaración de personal administrativo y académico con cargo directivo de los niveles de pregrado, posgrado y segunda especialidad, según corresponda, así como a nivel institucional, vinculados a la gestión de la universidad o escuela de posgrado, que incluya formación académica, antigüedad en la institución y tipo de contrato, así como el órgano y/o unidad orgánica donde desempeña funciones. El formato debe estar firmado por el representante legal.', 2),
(0, '1.2.2.6 Declaración jurada de los miembros que participan del gobierno y autoridades de la universidad o escuela de posgrado de no encontrarse inscritos en el REDERECI, REDAM, no haber sido condenado por delito doloso con sentencia de autoridad de cosa juzgada, no haber sido condenado o estar procesado por los delitos a los que se refiere la Ley N° 29988 y sus modificatorias.', 2),
(0, '1.2.2.7 Declaración jurada de intereses de los miembros que participan del gobierno de la universidad o escuela de posgrado y autoridades, de forma que se evidencie en caso tengan intereses económicos, financieros, profesionales, empresariales u otros que pudieran interferir en el ejercicio de sus funciones o en la toma de las decisiones propias de su condición.', 2),
(0, '1.2.3.8 Documentos normativos o de gestión para el control interno o gestión de riesgos, donde se identifican los mismos y los procedimientos a seguir para su control o gestión a fin de garantizar el comportamiento ético de los miembros de la comunidad universitaria y sus autoridades y el contar con medidas contra actos irregulares y de corrupción.\r\n*En el caso de las universidades públicas, se sujeta a la normativa nacional aplicable.', 3),
(0, '1.2.3.9 Política, Plan o Código de Buen Gobierno o documento(s) equivalente(s) que define la actuación de los órganos de gobierno en las siguientes materias:\r\n- Principios, valores y comportamiento ético tanto de los miembros de la comunidad como para el ejercicio de la autoridad y la actuación de los integrantes de los órganos de gobierno.\r\n- Procedimientos para prevenir y sancionar el hostigamiento sexual y otros tipos de acoso, incluye mecanismos de protección mientras duren los procedimientos disciplinarios internos.\r\n- Procedimientos para garantizar la libertad académica, libertad de asociación y la libertad de expresión en los miembros de la comunidad.\r\n- Procedimientos para el manejo de conflicto de intereses.\r\n- Procedimientos para la atención y resolución de controversias, reclamos y denuncias.\r\n- Procedimientos para la rendición de cuentas para responder e informar de manera periódica y participativa sobre el desempeño de la institución.\r\n- Procedimientos para prevenir, erradicar y sancionar la reproducción de discursos denigratorios y prácticas discriminatorias.\r\n- Órgano(s) o responsable(s) encargados del cumplimiento del Código de Buen Gobierno o documento(s) equivalente(s).', 3),
(0, '1.2.3.10 Informe y evidencia de la implementación de los procedimientos establecidos en la política, plan o código de buen gobierno o documento(s) equivalente(s), correspondientes al último año previo a la presentación de la solicitud de renovación. Para ello, se tendrá en cuenta los distintos procesos de supervisión realizados por la Sunedu vinculados con el cumplimiento de la Ley en lo referente a los temas establecidos en el 1.2.3.8 y 1.2.3.9.\r\n*En caso de contar con filiales, se evidencia la implementación de los procedimientos en las mismas.', 3),
(0, '1.3.4.11 Plan Estratégico Institucional vigente que incluya los recursos financieros para garantizar su operatividad. Debe contener como mínimo: i) objetivos con sus respectivos indicadores y metas, ii) responsables y iii) presupuesto. En el caso de las universidades o escuelas de posgrado privadas, el Plan deberá considerar un horizonte mínimo de 2 años y en el caso de las universidades públicas alinearse a las disposiciones del CEPLAN. El plan debe tener como referencia los Objetivos del Desarrollo Sostenible, así como con los planes de desarrollo regionales y políticas nacionales.\r\nSe evidencia que el plan parte de un diagnóstico y/o evaluación del cumplimiento de los objetivos trazados en los instrumentos de planificación anteriores, así como con los aspectos de mejora identificados, además que en la elaboración de este haya participado la comunidad universitaria. Asimismo, el Plan debe incluir estrategias para la implementación del Modelo educativo.\r\n*En caso de contar con filiales, se evidencia que son integradas dentro de la planificación institucional.\r\n**Los indicadores deberán contar con fichas técnicas de medición, que incluyan como mínimo: i) fórmula de cálculo del indicador y la descripción las variables utilizadas en la fórmula, ii) periodicidad de la medición y iii) responsable de la medición.', 4),
(0, '1.3.4.12 Plan Operativo Institucional vigente, con un horizonte mínimo de un año, que incluya los recursos financieros para garantizar su operatividad. Debe contener como mínimo: i) actividades específicas con sus respectivas metas, articuladas a los objetivos institucionales; iii) cronograma de ejecución de las actividades, iv) responsables y v) presupuesto por actividades. Se evidencia que el plan parte de un diagnóstico y/o evaluación del cumplimiento de los logros trazados en los instrumentos de planificación anteriores, así como los aspectos de mejora identificados.\r\n*En el caso de las universidades públicas, deberán presentar además su Plan Operativo Multianual, ambos documentos deben alinearse a las disposiciones del CEPLAN.\r\n**Los indicadores deberán contar con fichas técnicas de medición, que incluyan como mínimo la i) fórmula de cálculo del indicador y la descripción las variables utilizadas en la fórmula, ii) periodicidad de la medición y iii) responsable de la medición.\r\n***En caso de contar con filiales, se evidencia que son integradas dentro del Plan Operativo Institucional.\r\n****En caso de que la universidad o escuela de posgrado presente nueva oferta, el Plan tendrá un horizonte de mínimo de cinco (5) años e incluye las actividades vinculadas a la implementación progresiva de los componentes de docentes, infraestructura física y tecnológica, bienestar de la comunidad universitaria (para filiales o locales nuevos) e investigación (para filiales nuevas).\r\n*****En caso de contar con programas semipresenciales y/o a distancia, se incluye actividades específicas para lo(s) mismo(s), orientadas al adecuado funcionamiento del proceso de enseñanza-aprendizaje en entornos virtuales.', 4),
(0, '1.3.4.13 Informe y evidencias de la ejecución, seguimiento y evaluación, del Plan Estratégico Institucional y del Plan Operativo Institucional, de los últimos dos (02) años y del año de la presentación de la solicitud de renovación.', 4),
(0, '1.4.5.14 Plan de gestión de la calidad, aprobado por la autoridad competente, y con un horizonte mínimo de dos (2) años. Se orienta hacia el desarrollo de un sistema de gestión de la calidad interna y elaboración de estrategias para medir el impacto generado290 de las distintas acciones de la universidad. Debe contener como mínimo: i) objetivos con sus respectivos indicadores y metas, ii) actividades específicas con sus respectivas metas, iii) cronograma de ejecución de las actividades, iv) responsables; v) presupuesto por actividades; y, vi) fuentes de financiamiento.\r\n*Los indicadores deberán contar con fichas técnicas de medición, que incluyan como mínimo la i) fórmula de cálculo del indicador y la descripción las variables utilizadas en la fórmula, ii) periodicidad de la medición y iii) responsable de la medición.\r\n**En el caso de las universidades públicas, el presupuesto por actividad debe vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.\r\n***En caso de contar con filiales, se evidencia que son integradas dentro del Plan.\r\n**** En caso de contar con programas en modalidades semipresenciales y/o a distancia, el plan incluye acciones destinadas al aseguramiento de la calidad para dichas modalidades, involucrando al o la(s) área(s) organizacional(es) responsable(s) del desarrollo, seguimiento, monitoreo y mejora de los procesos de enseñanza-aprendizaje en entornos no presenciales de enseñanza y las áreas de gestión académica de los programas semipresenciales y/o a distancia. Incluye indicadores para medir la calidad de los distintos componentes de los programas semipresenciales y/o a distancia y estrategias de autoevaluación de los programas.\r\n*****En el caso de las universidades interculturales, establece objetivos e indicadores específicos para asegurar la calidad de los programas con naturaleza intercultural, con criterios pertinentes para ello291.\r\n******En caso cuente con programas de doctorado, se evidencia que cuenta con indicadores específicos para medir la calidad de estos; principalmente en aspectos de producción científica y su impacto. De ser el caso, aplica por sede y/o filial.', 5),
(0, '1.4.5.15 Informe y evidencias de la implementación del Plan de gestión de la calidad, de los últimos dos (02) años y del año de la presentación de la solicitud de renovación, centradas principalmente en el desarrollo progresivo del sistema de gestión de la calidad interna.', 5),
(0, '1.4.5.16 Informe y evidencias de los procesos de autoevaluación de las Condiciones Básicas de Calidad, donde ha participado la comunidad universitaria, y cuyos resultados han sido incorporados en la planificación institucional y de la gestión de la calidad vigentes.\r\n*En el caso de las Escuelas de Posgrado, se evidencia que la autoevaluación y realización de la planificación institucional ha sido realizada por el Comité Consultivo permanente conformado por estudiantes, egresados, docentes y empleadores que no tengan vinculación con la universidad o escuela de posgrado.', 5),
(0, '1.5.6.17 (UPU) Presupuesto Institucional de ingresos y gastos, programado y ejecutado, de los de los dos (2) últimos años y del año de la solicitud de renovación, elaborado acorde a la normativa de los sistemas administrativos del Estado. El presupuesto de gastos debe incluir como mínimo el detalle articulado a las CBCs: a) Gestión estratégica y soporte institucional, b) Docencia y enseñanza-aprendizaje, c) Investigación, innovación y creación artística, d) Relación con la comunidad y el entorno. Asimismo, debe vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento, así como con sus documentos de planificación institucional. Se evidencia el cumplimiento del gasto del 2% del presupuesto en proyectos de Responsabilidad Social.\r\n*De ser el caso, se detalla a nivel sede y filiales, así como a nivel de pregrado y posgrado, de ser el caso.\r\n**En caso cuente con programas de doctorado, se evidencia que cuentan con recursos económicos y financieros para asegurar el cumplimiento de los objetivos de investigación. Asimismo, debe establecer una estrategia de diversificación de fuentes de financiamiento orientadas hacia la captación de recursos externos para el financiamiento de la investigación. Se tiene claridad del costo de la propuesta formativa y cómo se financia. Incluye presupuesto para becas a los estudiantes o financiar sus investigaciones. De ser el caso, aplica por sede o filial.', 6),
(0, '1.5.6.18 (UPU) Directiva(s) que tengan injerencia en la gestión financiera, respecto al manejo de caja chica, rendición de viáticos, entre otros. Aprobada(s) por la autoridad competente.', 6),
(0, '1.5.6.19 (UEP) Política(s) de gestión financiera: i) recuperación de cuentas por cobrar , que plasme las acciones a realizar para su recuperación, criterios de provisión y castigo, ii) préstamos a accionistas y empresas relacionadas, que plasme los requisitos y condiciones en las que se realizarán los préstamos y la recuperación, iii) reinversiones, acorde al lineamiento de reinversiones para universidades asociativas y acorde a la Ley general de sociedades para universidades societarias, iv) pagos de dividendos, en caso sea universidad societaria, acorde a la Ley general de sociedades, v) Política de diversificación de fuentes de financiamiento como centros de idiomas, consultorías, donaciones, vi) Política o directiva de caja chica. Debe (n) contener, mínimamente: i) Base legal, ii) objetivos e indicadores, iii) principios y lineamientos.\r\n*De ser el caso, se detalla a nivel sede y filiales.\r\n**En caso cuente con programas de doctorado, se evidencia que la política de diversificación de fuentes de financiamiento se orienta hacia la captación de recursos externos para el financiamiento de la investigación. De ser el caso, aplica por sede o filial.', 6),
(0, '1.5.6.20 (UEP) Estados financieros de los últimos (03) tres años con notas contables.\r\n*De ser el caso, se detalla a nivel sede y filiales.', 6),
(0, '1.5.6.21 (UEP) Declaración jurada anual de ingresos presentada a la Sunat de los últimos (03) tres años.', 6),
(0, '1.5.6.22 (UEP) Presupuesto institucional de ingresos y gastos, programado y ejecutado, de los de los dos (2) últimos años y del año de la solicitud de renovación. El presupuesto de gastos debe incluir como mínimo el detalle articulado a las CBCs: a) Gestión estratégica y soporte institucional, b) Docencia y enseñanza-aprendizaje, c) Investigación, innovación y creación artística, d) Relación con la comunidad y el entorno. Se evidencia el 2% del presupuesto asignados a proyectos de Responsabilidad Social.\r\n*De ser el caso, se detalla a nivel sede y filiales, así como a nivel de pregrado y posgrado.\r\n**En caso cuente con programas de doctorado, se evidencia que cuentan con recursos económicos y financieros para asegurar el cumplimiento de los objetivos de investigación. Se tiene claridad del costo de la propuesta formativa y cómo se financia. Incluye presupuesto para becas a los estudiantes o financiar sus investigaciones. De ser el caso, aplica por sede o filial.', 6),
(0, '1.5.6.23 (UEP) Evidencia de la ejecución de la(s) política(s) de gestión financiera de los dos (2) últimos años y del año la solicitud de renovación. Para ello, se tendrá en cuenta los distintos procesos de supervisión que ha llevado la Sunedu vinculadas al uso de recursos.', 6),
(0, '1.5.7.24 (UPU) Presupuesto Institucional de ingresos y gastos proyectado para los próximos cinco (05) años, elaborado a acorde a la normativa de los sistemas administrativos del Estado. El presupuesto de gastos debe incluir como mínimo el detalle articulado a las CBCs: a) Presupuesto de Gestión estratégica y soporte institucional, b) Docencia y enseñanza-aprendizaje, c) Investigación, innovación y creación artística, d) Relación con la comunidad y el entorno. Asimismo, debe vincularse con los instrumentos de planificación presentados en los distintos medios de verificación de las CBCs, la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento. Incluye premisas que sustenten sus proyecciones. Se asegura la asignación del 2% del presupuesto para proyectos de Responsabilidad Social. La información debe estar firmada por el representante legal de la universidad.\r\n*De ser el caso, se detalla a nivel sede y filiales, así como a nivel de pregrado y posgrado.\r\n** El presupuesto de los tres (3) primeros años deberá ser concordante con la asignación multianual del presupuesto, y deben precisarse las premisas usadas para la proyección de los siguientes dos (2) años.', 7),
(0, '1.5.7.25 (UPU) En el caso de que la universidad solicite nueva oferta de programas, local o filial, debe incluir el plan de financiamiento de la oferta académica que pretenda ampliar, para al menos una promoción según el nivel del programa (pregrado o posgrado, según corresponda). Para el caso de creación de nueva filial o local, el plan de financiamiento debe articularse con el presupuesto institucional. El plan de financiamiento debe vincularse con los instrumentos de planificación institucional, la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento. Incluye premisas que sustenten sus proyecciones.', 7),
(0, '1.5.7.26 (UEP) Estado de resultados proyectado para los próximos (05) cinco años. Incluye premisas que sustenten los ingresos (pregrado y posgrado en caso corresponda), como el número de estudiantes, y los gastos y estrategias que permitan el cumplimiento de sus proyecciones.\r\nEn caso la Universidad se presenté al procedimiento con nueva oferta, ésta se debe ver reflejada en las proyecciones. Asimismo, las inversiones proyectadas para el mismo periodo deben alinearse al PEI.\r\n*De ser el caso, se detalla a nivel sede y filiales.', 7),
(0, '1.5.7.27 (UEP) Presupuesto Institucional proyectado de ingresos y gastos para los próximos cinco (05) años. El presupuesto de gastos debe incluir como mínimo el siguiente detalle: Presupuesto de Gestión estratégica y soporte institucional, Docencia y enseñanza-aprendizaje, Investigación, innovación y creación artística, Relación con la comunidad y el entorno. Debe vincularse con los instrumentos de planificación presentados en los distintos medios de verificación de las CBCs. Se asegura el cumplimiento del gasto del 2% del presupuesto en proyectos de Responsabilidad Social. La información debe estar firmada por el representante legal.\r\n*De ser el caso, se detalla a nivel sede y filiales, así como a nivel de pregrado y posgrado.', 7),
(0, '1.5.7.28 (UEP) En el caso de que la universidad o escuela de posgrado solicite nueva oferta de programas, local o filial, debe presentar el plan de financiamiento de la oferta académica que pretenda ampliar, para al menos una promoción según, el nivel del programa (pregrado o posgrado). Para el caso de creación de nueva filial o local, el plan de financiamiento debe articularse con el presupuesto institucional.', 7),
(0, '1.6.8.29 Documento normativo que regule los mecanismos en los sistemas para la recolección, revisión, análisis, sistematización, conservación y difusión de la información. En el mismo, se regula también aspectos para: i) Salvaguardar la propiedad intelectual, ii) Protección de datos y privacidad, iii) Seguridad informática.', 8),
(0, '1.6.8.30 Informe técnico que detalle los mecanismos y sistemas de información con los que cuenta, cómo se integran entre ellos y un diagnóstico sobre la necesidad de actualización. Además, describe cómo se realiza el traslado de información al Sistema de Información Universitaria (SIU). Asimismo, para cada uno de los sistemas de información se deberá indicar los enlaces, usuarios y contraseñas de acceso.\r\nLos mecanismos y sistemas de información deben dar soporte a los siguientes procesos:\r\na) Gestión académica (registro y monitoreo de actividades académicas vinculadas a los docentes, matrícula y registro académico).\r\nb) Gestión administrativa, económica y financiera.\r\nc) Gestión de biblioteca y acervo bibliográfico (registro y monitoreo de uso de bibliografía física y virtual por todos los canales puestos a disposición de la comunidad universitaria).\r\nd) Gestión de documentos y archivos.\r\ne) Gestión basada en indicadores (incluye como mínimos los siguientes indicadores: admisión, tasas de deserción, permanencia, graduación oportuna, empleo, continuidad en el posgrado, origen socioeconómico y cultural de su población, entre otros)\r\nf) Gestión de reclamos, quejas y denuncias.\r\ng) Gestión del seguimiento al egresado, graduado y titulado, de acuerdo con sus mecanismos establecidos.\r\n*De ser el caso, gestionan información a nivel de sede, filial y local, evidenciando su operatividad en las mismas.\r\n**En caso de no contar con un sistema que brinde soporte a los procesos de gestión de documentos y archivos, y/o gestión basada en indicadores se incluye su desarrollo e implementación en la planificación institucional presentada en el indicador 4.\r\n***En caso ser una universidad intercultural, o no intercultural ubicada en una zona con predominio de una lengua originaria, , los sistemas son acordes a los derechos lingüísticos de los mismos de acuerdo con el Decreto Supremo N° 004-2016-MC y demás normativa que resulte aplicable, o en su defecto se incluye el desarrollo e implementación de sistemas acordes a dichos derechos en la planificación institucional presentada en el indicador 4.', 8),
(0, '1.6.8.31 Registros y/o reportes emitidos por los sistemas de información de cada uno de los siguientes procesos:\r\n(i) Gestión académica (registro de docentes, estudiantes, planes de estudio, mallas curriculares, entre otros).\r\n(ii) Gestión administrativa, económica y financiera. (Registro de trámites administrativos, reporte contable y de gestión financiera)\r\n(iii) Gestión biblioteca y acervo bibliográfico (registro codificado del acervo bibliográfico físico y digital).\r\n(iv) Gestión de documentos y archivos (reportes según tipos de documentos y archivos) (de contar)\r\n(v) Gestión basada en indicadores (registros de indicadores) (de contar)\r\n(vi) Gestión de reclamos (registro y seguimiento de la atención de reclamos)\r\n(vii) Gestión de seguimiento a graduados (registro de graduados)', 8),
(0, '1.6.8.32 Manuales de uso de cada uno de los sistemas de información. Se encuentran actualizados, publicados y aprobados por la autoridad competente.', 8),
(0, '1.6.8.33 De ser el caso, convenios y/o contrato(s) de implementación, arrendamiento y/o licencia de uso de cada uno de los sistemas de información, según corresponda. Estos documentos deberán:\r\n- Especificar el nombre, razón social o RUC de la universidad o escuela de posgrado.\r\n- Estar vigentes y tener una duración no menor a un (1) año a partir de la fecha de presentación.\r\n- Estar suscritos por la autoridad competente.', 8),
(0, '1.6.8.34 De ser el caso, documento normativo aprobado por la autoridad competente, que aprueba el funcionamiento de los sistemas desarrollados por la propia universidad o escuela de posgrado.', 8),
(0, '1.6.8.35 Reglamento o instrumento normativo que regula la transparencia y acceso a la información pública, así como los procesos y mecanismos para la gestión, presentación y publicación de esta, los cuales deben ser interoperables con el Sistema de Información\r\nUniversitaria (SIU) de la Sunedu.', 8),
(0, '1.6.8.36 Portal web institucional donde se evidencia que:\r\n(i) contiene la información exigida en la Ley Universitaria y normativa aplicable de forma permanente y actualizada,\r\n(ii) incorpora información en lengua originaria (en caso corresponda, de acuerdo con el Decreto Supremo N° 004-2016-MC y Decreto Supremo N° 005-2017-MC y demás normativa que resulte aplicable) o en su defecto se incluye el desarrollo e implementación de dicha información en la planificación institucional presentada en el indicador 4.\r\n(iii) tiene opciones de acceso para personas con algún tipo de discapacidad, que pueda limitar su acceso a la información.\r\n*En caso corresponda, información de los requerimientos necesarios para el desarrollo de los programas en modalidades semipresencial y/o a distancia, así como el modelo educativo y la estrategia pedagógica. Incluye: los requerimientos tecnológicos, carga de trabajo necesario para desarrollar los cursos (tiempo requerido), las actividades presenciales y de práctica (de ser el caso).\r\n**En caso de contar con programas de doctorado, se hace público en la página web institucional o vinculada a los programas, la producción científica de cada uno de los programas, así como las acciones realizadas en el marco de la estrategia para el desarrollo de la investigación y formación de investigadores. De ser el caso, aplica por sede o filial.', 8),
(0, '1.7.9.37 Documento que contenga la política de redes interinstitucionales o documento equivalente, aprobado por la autoridad competente, que mínimamente, incluye: i) base legal, ii) objetivos; iii) lineamientos o estrategias para la movilidad académica de sus docentes y estudiantes y la colaboración interinstitucional en actividades académicas, de investigación, de responsabilidad social (proyectos de cooperación orientados al desarrollo ), entre otras; iv) estrategias de vinculación con el sector productivo y social, y su repercusión en la formación, investigación y servicios que se brinde.\r\n*De ser el caso, tiene alcance a nivel de la sede y filiales.\r\n**Para las universidades interculturales, entre las estrategias se incluye programas de movilidad académica de docentes investigadores en temática intercultural con instituciones nacionales e internacionales292 así como de vinculación con las organizaciones indígenas293.\r\n***En caso de contar con programas de doctorado, cuenta con a) estrategias de movilidad académica para la presentación de resultados en congresos nacionales o internacionales o pasantías de investigación tanto para investigadores y estudiantes o estadías doctorales, b) alianzas y redes vinculadas a la investigación (y de acuerdo a la naturaleza del programa, articulación con el entorno-sector productivo y social), que establecen pasantías y estancias de estudiantes, así como la realización de investigación conjunta. Estas estrategias tienen alcance para todos los programas de doctorado y son pertinentes con el enfoque y área de investigación de estos. De ser el caso, aplica por sede o filial.', 9),
(0, '1.7.9.38 Plan para el desarrollo de redes interinstitucionales con un horizonte mínimo de dos (2) años y aprobado por la autoridad competente. Que contenga como mínimo: i) objetivos con sus respectivos indicadores y metas, ii) acciones estratégicas con sus respectivos indicadores y metas, iii) actividades con sus respectivas metas; v) cronograma de ejecución de las actividades, vii) responsables, viii) presupuesto por actividades y ix) fuentes de financiamiento. Debe incluir a la sede y filiales, según corresponda. Puede ser parte de otros instrumentos de planificación institucional.\r\n*En caso la universidad oferte programas de doctorado, el Plan incluye el desarrollo de estrategias de movilidad académica, así como de alianzas y redes vinculadas a la investigación.\r\n**En el caso de las universidades públicas, el presupuesto por actividad debe vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.\r\n***Los indicadores del plan deberán contar con fichas técnicas de medición, que incluyan como mínimo: i) fórmula de cálculo del\r\nindicador y la descripción las variables utilizadas en la fórmula, ii) periodicidad de la medición y iii) responsable de la medición.', 9),
(0, '1.7.9.39 Convenios con instituciones de educación superior y otras instituciones del sector público y/o privado nacional y/o internacional orientados a establecer oportunidades de movilidad y colaboración para impulsar el desarrollo de actividades académicas, investigación, responsabilidad social, entre otros relacionadas, tanto para programas de pregrado como de posgrado. Debe incluir a la sede y filiales, según corresponda.', 9),
(0, '1.7.9.40 Informe y evidencias del desarrollo de redes interinstitucionales y de la gestión de los convenios orientados a la implementación de dichas redes, del último año previo a la presentación de la solicitud de renovación.\r\n*En caso de contar con programas de doctorado, se evidencia la implementación de las estrategias y alianzas, así como los resultados obtenidos para cada programa. De ser el caso, aplica por sede o filial.', 9),
(0, '1.7.10.41 Documento que contenga la política de internacionalización o documento equivalente (pudiendo formar parte del documento del indicador 9, 1.7.9.38, aprobado por la autoridad competente, que mínimamente, incluye: i) base legal, ii) objetivos; iii) lineamientos o estrategias para la internacionalización (de acuerdo con los fines y planificación de la universidad, puede incluir: i) realizar y promover investigaciones conjuntas; ii) programas académicos en conjunto (en modalidades como doble grado, articulación vertical, grado conjunto, co-tutela; asegurando el cumplimiento de lo establecido por la Ley Universitaria); iii) cooperación en proyectos o programas de responsabilidad social; iv) cooperación para el desarrollo de capacidades académicas o de gestión; v) movilidad académica de docentes y/o estudiantes; vi) realización de encuentros científicos o tecnológicos); vii) responsables de la gestión de la internacionalización; viii) criterios y parámetros académicos para la determinación de las instituciones con las que se coopere; ix) criterios para la participación de los miembros de la comunidad universitaria en los mecanismos de internacionalización; entre otros. Las evidencias del desarrollo de la política se evalúan de acuerdo con los 1.7.9.39  y 1.7.9.40.', 10),
(0, '1.8.11.42 Formato de Renovación de Licencia R-A2 que contiene el listado de todos los locales que forman parte del patrimonio de la universidad o escuela de posgrado, y que precisa los locales sobre los cuales ejerce pleno derecho de uso para brindar ininterrumpidamente servicios educativos conducentes a grado académico, servicios de bienestar y otros servicios que vinculen a la comunidad universitaria. El formato debe estar firmado por el representante legal.', 11),
(0, '1.8.11.43 Formato de Renovación de Licencia R-C3 donde se especifica la totalidad de las siguientes unidades de infraestructura con las que cuenta en cada uno de sus locales: aulas, laboratorios de enseñanza, cómputo e investigación, talleres, ambientes para docentes, bibliotecas, hemerotecas, pinacotecas, ambientes destinados a servicios de bienestar, salas de estudio con acceso a TICS, entre otros. El formato debe estar firmado por el representante legal.', 11),
(0, '1.8.11.44 Documentos que acrediten que mantiene el derecho real para cada uno de los locales conducentes a grado académico, donde se brinden servicios de bienestar y otros servicios que vinculen a la comunidad universitaria; aplica para los casos en los que la modalidad de derecho real tenga una vigencia definida, en los que se debe asegurar una vigencia por al menos cinco (5) años contabilizados desde el inicio del semestre académico en el que presenta su solicitud de renovación de licencia, respecto de la totalidad del inmueble destinado a la prestación del servicio. La Universidad puede acreditar el derecho real sobre los locales mediante propiedad, arrendamiento, donación, convenio u otra modalidad.\r\nLa universidad o escuela de posgrado declara en el Formato de Renovación de Licencia R-A2 el número de la partida registral y/o número de registro de predio (considerar inscripciones en las partidas registrales de los sistemas SIR y SARP294) así como la oficina registral a la cual pertenece295, para todos los locales que forman parte de su patrimonio y sobre los cuales ejerce pleno derecho de uso para brindar el servicio educativo conducente a grado académico, donde se brinden servicios de bienestar y otros servicios que vinculen a la comunidad universitaria.\r\n*En caso, pretenda crear nuevos locales, evidencia el derecho real para cada uno de los nuevos locales conducentes a grado académico, donde se brinden servicios de bienestar y otros servicios que vinculen a la comunidad universitaria.', 11),
(0, '1.8.11.45 Informe descriptivo del estado actual de la infraestructura por local, que incluye a todos los locales de la universidad, conducentes a grado académico, donde se brinden servicios de bienestar y otros servicios que vinculen a la comunidad universitaria. Este debe contener, como mínimo:\r\n(i) Análisis de ocupabilidad y disponibilidad horaria que permita determinar el uso máximo de la infraestructura de un local conducente a grado académico, respecto de su capacidad instalada, así como su disponibilidad para usos actuales y proyectados. El análisis se realiza en base a los horarios de uso de ambientes, así como horarios de clases por curso, del último semestre académico anterior a la solicitud. Ambos horarios se anexan, y para el caso del primero, se detalla por curso, programa, y ciclo académico.\r\n(ii) Estudio técnico de cálculo de aforo actualizado de cada local elaborado por un arquitecto o ingeniero colegiado y habilitado. Debe garantizarse la independencia del profesional que lo emita respecto a la universidad o escuela de posgrado.\r\n(iii) Memoria descriptiva y/o análisis que demuestra que el local es accesible para las personas con discapacidad, que tiene usos exclusivos y/o compatibles con los fines de la universidad y que cumple con la normativa vigente en materia de edificaciones o se incluye en la planificación institucional presentada en el indicador 4, acciones para que la infraestructura sea accesible a personas con discapacidad y se adecúe a la normativa vigente en materia de edificaciones. En el caso de locales que sean resultado de predios colindantes, la Universidad incluye diagramas de acumulación identificando cada uno de los inmuebles que la conforman.\r\n(iv) Memoria descriptiva y matriz de detalle de servicios públicos de agua y desagüe, energía eléctrica.\r\n*En caso, pretenda crear nuevos locales, el informe evidencia que se cumple con los mínimos anteriormente citados al menos para los dos primeros años de funcionamiento de los programas.', 11),
(0, '1.8.11.46 Planos de Ubicación y Arquitectura actualizados de todos los locales conducentes a grado académico, suscritos y elaborados por un profesional responsable. Estos serán solicitados previa realización de verificaciones presenciales físicas o remotas.', 11),
(0, '1.8.12.47 Formato de Renovación de Licencia R-C6 donde se especifica cada laboratorio de enseñanza, cómputo y de investigación, y talleres. Los Formatos deben estar firmados por el representante legal.', 12),
(0, '1.8.12.48 Formato de Renovación de Licencia R-C6.1 donde se especifica cada recurso no presencial: laboratorios o simuladores virtuales, mecanismos de realidad aumentada o laboratorios remotos, o herramientas digitales. Los Formatos deben estar firmados por el representante legal.', 12),
(0, '1.8.12.49 Formato de Licenciamiento R-C7 donde se especifica el equipamiento, software, otros recursos informáticos similares y mobiliario, disponibles en cada laboratorio de enseñanza, cómputo y de investigación, y taller. Los formatos deben estar firmados por el representante legal.', 12),
(0, '1.8.12.50 Formato de Renovación de Licencia R-C8 donde se especifica los ambientes para docentes, así como el equipamiento, software, recursos no presenciales y mobiliario disponibles. Se evidencia que la universidad cuenta con ambientes para docentes con capacidad de aforo suficiente para atender a sus docentes a tiempo completo. Asimismo, la Universidad define y sustenta los ambientes necesarios para atender a los docentes a tiempo parcial. Los Formatos deben estar firmados por el representante legal.', 12),
(0, '1.8.12.51 Informe que detalla todos los recursos necesarios para el desarrollo de la oferta académica, investigación, actividad docente, servicios de bienestar y responsabilidad social y aprendizaje extracurricular. El informe contiene:\r\n(i) Agrupamiento de laboratorios y talleres por tipología a nivel de local, de ser el caso. La Universidad define y sustenta las tipologías de laboratorios y talleres, pudiendo tomar como punto de partida las siguientes categorías o criterios: (i) función: cómputo, enseñanza e investigación; (ii) área del conocimiento: ciencias básicas, ciencias médicas y de la salud, ingeniería, entre otras, (iii) homogeneidad: del espacio físico, del equipamiento, de los equipos de seguridad, entre otras.\r\n(ii) Matriz descriptiva por cada curso, programa académico y líneas de investigación, en la que se detalla las horas de práctica (horas de práctica en aula, laboratorio o taller, campo, entidades externas, otros) y los recursos de aprendizaje necesarios (infraestructura, equipamiento, software, recursos no presenciales y mobiliario) para el desarrollo de los componentes práctico y teórico de los mismos, así como el cumplimiento de los objetivos académicos. La matriz es consistente con la información declarada en los Formatos de Renovación de Licencia R-C1, R-C6, R-C7 y R-C6.1. Los recursos de aprendizaje comprenden laboratorios de enseñanza, cómputo y de investigación, talleres, aulas; equipos de laboratorio y taller; softwares, laboratorios y simuladores virtuales, entre otros.\r\n(iii) Matriz descriptiva que detalla los recursos necesarios por local, para el desarrollo de la actividad docente como tutoría y de los servicios de bienestar como servicio de tópico, servicio de bibliotecas, psicopedagógico, actividades deportivas y culturales, entre otros.\r\n(iv) Matriz descriptiva que detalla los recursos necesarios por local, para el desarrollo del aprendizaje extracurricular como salas de estudio con acceso a TICS, salas de trabajo para estudiantes, entre otros.\r\n(v) De ser el caso, mecanismos adecuados para el acceso de estudiantes con discapacidad a través de estrategias instructivas alternativas y/o remisión a recursos institucionales especiales.\r\nSegún corresponda, se anexa licencias o documentos sucedáneos para uso de software y otros recursos informáticos similares empleados como recursos para el aprendizaje de por lo menos un (01) año. Se presenta un listado resumen de las licencias o documentos sucedáneos, que detalla tipo de licencia, inicio y fin de la licencia, de manera consistente con los documentos presentados.\r\n*En caso pretenda crear nueva oferta, el informe evidencia que se cumple con los mínimos anteriormente citados al menos para los dos primeros años de funcionamiento de los programas.\r\n**En el caso de las Escuelas de Posgrado, se evidencia que en todas sus aulas y salas de estudio tienen acceso TICs.\r\n***En caso cuente con programas de doctorado, se evidencia que se cuenta con laboratorios de investigación y otros espacios de investigación, así como recursos especializados (software, recursos no presenciales), según el área, el enfoque de investigación y el número de estudiantes y docentes, de forma que se evidencie que se permite alcanzar los objetivos de investigación. De ser el caso,\r\naplica por sede o filial.', 12),
(0, '1.8.13.52 Informe elaborado por un profesional independiente en el área Tecnología de la Información y la Comunicación (según clasificador CINE 2018) que garantice que se cuenta con el soporte tecnológico necesario para garantizar la accesibilidad, seguridad, estabilidad, funcionalidad y disponibilidad de los procesos académicos y administrativos, según el total de usuarios proyectados (estudiantes, docentes y no docentes), modalidades de enseñanza, sistemas de información, recursos no presenciales, entre otros. Debe demostrar como mínimo lo siguiente:\r\n(i) Características de servidores, equipos y softwares que brindan soporte tecnológico a los procesos institucional.\r\n(ii) Memoria descriptiva y Matriz de detalle de servicios internet (ancho de banda) y telefonía.\r\n(iii) Descripción del acceso y conectividad de internet y telefonía en los distintos ambientes de la universidad (local y/o filial).\r\n(iv) Pertinencia según la ubicación geográfica donde se brinda el servicio.\r\n(v) Pertinencia del soporte tecnológico acorde a la capacidad máxima de usuarios conectados a los sistemas de información, sistema de aprendizaje virtual y recursos no presenciales (laboratorios virtuales, simuladores virtuales, mecanismos de realidad aumentada, laboratorios remotos o en casa, herramientas digitales, entre otros), según tipos de programa, cursos y matriculados.\r\n*En caso de que se oferte programas a distancia, se garantiza su operación durante las 24 horas de todos los días que duren los períodos académicos.\r\n**De ser el caso, se evidencia que el soporte tecnológico opera en condiciones similares en la sede como en la(s) filial(es) y local(es),\r\nde acuerdo con los contextos regionales y locales.', 13),
(0, '1.8.13.53 (UPU) Plan de gobierno digital vigente, en el que se establezca la ruta a mediano y largo plazo orientada al desarrollo y/o mejora de la infraestructura tecnológica y sistemas de información acorde a sus necesidades y tendencias, de acuerdo con la Resolución de Secretaría de Gobierno Digital N° 005-2018-PCM/SEGDI296 o la normativa que se encuentre vigente. El plan es elaborado por el Comité de Gobierno Digital297 y aprobado por la autoridad competente. Asimismo, el plan debe vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.', 13),
(0, '1.8.13.54 (UEP) Plan vigente que establezca las estrategias y acciones para alcanzar los objetivos orientados al desarrollo y/o mejora de la infraestructura tecnológica y sistemas de información acorde a sus necesidades y tendencias, alineado a su planificación estratégica y operativa. El plan es elaborado por los responsables del área de tecnologías de la información. Es aprobado por la autoridad competente para un periodo mínimo de tres (3) años. Puede ser parte de otro instrumento de planificación de la universidad o escuela de posgrado.', 13),
(0, '1.8.13.55 (UEP) Protocolos y mecanismos de seguridad informática y respaldo de la información que aseguren el correcto funcionamiento de la infraestructura tecnológica (sistemas de información, recursos no presenciales, entre otros) sin interrupciones.', 13),
(0, '1.8.14.56 Documento(s) que evidencie(n) la planificación del sistema de gestión de seguridad, que complementa y/o articula la seguridad y salud en el trabajo, seguridad en las edificaciones y gestión de riesgo de desastres298, para gestionar de manera integral la seguridad para la comunidad universitaria. El (los) documento(s) está(n) aprobado(s) por la autoridad competente y detalla(n) para cada local conducente a grado académico, de servicios de bienestar y/o que vinculen a la comunidad universitaria, los siguientes aspectos mínimos:\r\n(i) Diagnóstico (línea base, análisis, identificación de prioridades de los problemas del sistema de gestión de seguridad).\r\n(ii) Identificación de peligros y valoración de riesgos producto del desarrollo de las actividades académicas que el local alberga y de las características de la infraestructura, detallando criterios técnicos y/o referencias bibliográficas -IPERC.\r\n(iii) Determinación de las medidas de eliminación, reducción, control, minimización o mitigación del riesgo y estándares de seguridad, detallando criterios técnicos y/o referencias bibliográficas - IPERC.\r\n(iv) Cronograma de actividades y/o diagrama de Gantt detallado por local para cada una de las actividades programadas, con sus respectivas metas, responsable y presupuesto. Para el caso de Universidades públicas deberá vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.\r\n(v) Gestión integral para el manejo de residuos sólidos y líquidos peligrosos, y RAEE. Según corresponda, anexa el contrato vigente ó\r\ndocumento sucedáneo, con la empresa encargada del traslado y la disposición final de residuos sólidos y líquidos peligrosos y RAEE.', 14),
(0, '1.8.14.57 Documento(s) descriptivo del sistema de gestión para la seguridad, que detalla aspectos vinculados al funcionamiento, procesos, personal operativo y administrativo responsable299, así como los procesos vinculados a la gestión de la seguridad, en concordancia con lo estipulado en sus documentos normativos y con la estructura orgánica declarada en el Indicador 2. Según corresponda, anexa las resoluciones de conformación, ratificación y/o nombramiento del Comité de Seguridad Química, Biológica y Radiológica.', 14),
(0, '1.8.14.58 Informe y evidencias de la implementación del sistema de seguridad Institucional y funciones del Comité de seguridad, química, biológica y radiológica (según corresponda) del último año previo a la presentación de la solicitud de renovación.', 14),
(0, '1.8.14.59 Planos de seguridad señalización, evacuación y mapa de riesgos vigente, que incluya los puntos de acopio y/o almacenamiento de residuos comunes, sólidos - líquidos peligrosos y/o RAEEs, según corresponda, actualizados y elaborados por un profesional responsable.', 14),
(0, '1.8.14.60 Documento que contenga la descripción, análisis y sustentación del servicio de seguridad y vigilancia en cada uno de los locales y según corresponda, anexa los contratos con empresas prestadoras del servicio de seguridad privada, o contratos privados en la modalidad de servicio de protección por cuenta propia.', 14),
(0, '1.8.14.61 Protocolos de seguridad actualizados de los laboratorios y talleres que detallan el proceso de identificación de peligros y valoración de riesgos de acuerdo con las actividades específicas que albergan cada uno. La universidad o escuela de posgrado puede agrupar los protocolos de acuerdo con la tipología de ambientes; no obstante, deberá considerar las características específicas para la identificación de peligros, valoración de riesgos y determinación de las medidas de eliminación, reducción, control, minimización o mitigación. Los protocolos deben estar firmados por la autoridad competente y contener, como mínimo:\r\n(i) Identificación de peligros y valoración de riesgo por cada laboratorio y taller, detallando criterios técnicos y referencias bibliográficas-IPERC.\r\n(ii) Determinación de las medidas de eliminación, reducción, control, minimización o mitigación del riesgo y estándares de seguridad, detallando criterios técnicos y referencias bibliográficas-IPERC.\r\n(iii) Procedimientos de trabajo seguro.\r\n(iv) Procedimientos específicos en caso de accidente.\r\n(v) Lineamientos para la seguridad en el manejo de productos químicos, biológicos o radiológicos, según corresponda; signos y etiquetas; señales y/o carteles de seguridad de acuerdo con la norma técnica correspondiente; y equipos de protección personal y colectiva.\r\n*En caso de ser una universidad intercultural, o no intercultural ubicada en una zona con predominio de una lengua originaria, de manera excepcional se incluye señales y/o carteles de seguridad en lengua indígena u originaria en los espacios que hagan uso los\r\nestudiantes.', 14);
INSERT INTO `medio` (`id`, `detalle`, `id_criterio`) VALUES
(0, '1.8.14.62 Documento(s) que evidencie(n) la planificación del sistema de gestión de mantenimiento de la infraestructura, equipamiento a nivel del local (instalaciones mecánicas, bombas, compresoras, entre otros), equipamiento académico y mobiliario de todos los locales. Para las universidades públicas el documento detalla la planificación de actividades para el mantenimiento y adicionalmente podrá presentar un informe respecto de las inversiones asociadas a la renovación, adquisición, y construcción300. Para la Universidades privadas se considera en la planificación las actividades vinculadas a mantenimiento, renovación, adquisición, y construcción301. El documento está aprobado por la autoridad competente y detalla para cada local conducente a grado académico, de servicios de bienestar y/o que vinculen a la comunidad universitaria, y debe contener como mínimo:\r\n(i) Diagnóstico (línea base, análisis identificación de prioridades de los problemas del sistema de gestión).\r\n(ii) Cronograma mensual de actividades y/o diagrama de Gantt detallado por local, responsables y presupuesto para cada una de las actividades programadas con sus respectivas metas. Estructurado en Actividades, partidas y subpartidas302 correspondientes a mantenimiento, renovación, adquisición, construcción; diferenciadas de acuerdo con el tipo de mantenimiento: preventivo, correctivo y recurrente. La universidad podrá complementar el presupuesto, con análisis de costos unitarios que sustenten el dimensionamiento presupuestal.\r\n*Para el caso de universidades públicas, el presupuesto deberá vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.', 14),
(0, '1.8.14.63 Documento(s) descriptivo del sistema de gestión para el mantenimiento, que detalla aspectos vinculados al funcionamiento orgánico, procesos, personal operativo y administrativo responsable, vinculados a la gestión de mantenimiento de la infraestructura, equipamiento a nivel del local, equipamiento académico y mobiliario, en concordancia con lo estipulado en sus documentos normativos y con la estructura orgánica declarada en el Indicador 2.', 14),
(0, '1.8.14.64 Informe y evidencias de ejecución y/o implementación del sistema para el mantenimiento de la infraestructura, equipamiento\r\ndel local, equipamiento académico y mobiliario, del último año previo a la presentación de la solicitud de renovación.', 14),
(0, '1.9.15.65 Plan de capacitación y desarrollo profesional para el personal no docente de acuerdo con sus funciones, con un horizonte mínimo de un (1) año y aprobado por la autoridad competente. Este Plan debe contener como mínimo: i) diagnóstico, ii) objetivos de las capacitaciones, iii) actividades a desarrollar, iv) cronograma, v) presupuesto, vi) metas y población beneficiaria, vii) responsables y viii) fuentes de financiamiento. Debe incluir acciones de seguimiento y evaluación del cumplimiento de las actividades. En el caso de las universidades privadas, el plan puede formar parte de otros instrumentos de planificación, y en el caso de las universidades públicas, deberá encontrarse alineado con lo dispuesto por Servir. Incluye capacitaciones en cuestiones de discapacidad y equidad de género.\r\n*En el caso de las universidades públicas, el plan debe vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.\r\n**De ser el caso, el plan aplica tanto para sede como para filiales.\r\n***En caso de ser una universidad intercultural, o no intercultural ubicada en una zona con predominio de una lengua originaria, se requiere capacitación también en el enfoque intercultural.', 15),
(0, '1.9.15.66 Informe y evidencias del cumplimiento del Plan de capacitación y desarrollo profesional del personal no docente, del último año previo y del año de la presentación de la solicitud de renovación.', 15),
(0, '1.10.16.67 Documento que contiene la Política de Responsabilidad Social Universitaria aprobado por la autoridad competente. Incluye como mínimo: i) propuesta institucional de RSU incluyendo el compromiso con el desarrollo sostenible; ii) objetivos generales, alineados con los Objetivos del Desarrollo Sostenible (ODS); iii) lineamientos o estrategias para el desarrollo de la RSU en las funciones formativas, de investigación, gestión y vinculación con el entorno; iv) actores de la comunidad involucrados en la política, así como el alcance respecto a sus funciones. Incluye mínimamente estrategias respecto a: a) promover el reconocimiento y valoración positiva de la diversidad desde las distintas funciones que desarrolla la universidad o escuela de posgrado, b) procesos para garantizar servicios de interpretación y/o traducción oportunas y accesibles para la atención de hablantes de lengua indígena.\r\n*Las evidencias de implementación de la política se analizarán en base a los informes y evidencias presentadas en los demás indicadores.', 16),
(0, '2.11.17.68 Resolución que aprueba, ratifica o modifica el plan de estudio de cada programa, aprobado por la autoridad competente, con\r\nmotivos de su actualización que debe ocurrir, como máximo, cada tres (3) años según la Ley Universitaria.', 17),
(0, '2.11.17.69 Planes de estudio de los programas, en los que se detallen, como mínimo, los siguientes elementos:\r\n- Fecha de aprobación.\r\n- Denominación del programa.\r\n- Mención(es), de ser el caso; modalidad(es) de enseñanza; el grado y título que otorga, y los requisitos para su obtención.\r\n- Objetivos académicos.\r\n- Perfil de ingreso.\r\n- Perfil del graduado/egresado.\r\n- La lista de cursos, precisando el ciclo; los créditos; si es general, específico o de especialidad; presencial o semipresencial o a distancia; electivo u obligatorio; horas de teoría y práctica por semestre; y la codificación que utilice cada uno de ellos.\r\n- Sumillas de los cursos que integran el plan de estudios, estableciendo los resultados de aprendizajes que se esperan lograr.\r\n- Malla curricular (esquema de cursos por ciclo).\r\n- Mapeo Curricular: Matriz de alineamiento entre los cursos y las competencias del perfil de egresado/graduado.\r\n- Lineamientos/metodologías de enseñanza-aprendizaje y evaluación. Estos deben ser coherentes con la naturaleza del programa y con los lineamientos establecidos en el modelo educativo institucional.\r\n- En caso corresponda, exigencia y duración de prácticas preprofesionales.\r\n- En caso de un cambio reciente en la malla curricular, cuadro de equivalencias de cursos, entre distintos planes de estudio del programa, en caso corresponda.\r\n*De corresponder, incluyen asignaturas sobre accesibilidad y el principio de diseño universal en los campos del diseño y la construcción, las edificaciones, el transporte, las telecomunicaciones y las tecnologías de la información303. Además, incluyen asignaturas sobre discapacidad en los campos de la educación, el derecho, la medicina, la psicología, la administración, la arquitectura, la ingeniería, la economía, la contabilidad y el trabajo social304.\r\n**En el caso de ser una universidad intercultural, o tener programas interculturales, se evidencia que los planes responden a dicha naturaleza por lo cual incluye, contenidos sobre saberes indígenas, o contenido intercultural (visión de una problemática desde dos o más perspectivas culturales), la enseñanza de una lengua originaria o cursos en lengua originaria, los derechos de los pueblos indígenas, la noción de la interculturalidad, entre otros; de acuerdo a la autonomía académica de cada institución305.\r\n***En caso se cuente con programas de doctorado, el perfil y los objetivos académicos son pertinentes a la formación de investigadores y para asegurar el desarrollo de productos de investigaciones. Dentro de la formación, se asegura la participación de los estudiantes en proyectos, centros o grupos de investigación (ya sea a través de los cursos o estrategias extracurriculares), apuntando a la interacción con entornos de investigación. Puede incluirse cursos y proyectos de investigación multi, inter o transdisciplinarios cuando sea pertinente. En el caso de una propuesta formativa secuencial a través de cursos, estos se dictan correspondiendo al nivel propio de la formación doctoral (posgrado). En el caso de que la propuesta formativa sea centrada en el desarrollo del proyecto de investigación y no la formación secuencial a través de cursos306 , se asegura y norma el acompañamiento continuo y permanente del asesor o co- asesores de tesis, así como estrategias de evaluación pertinentes y de participación intensiva en los entornos de investigación; así como para la admisión, se exige mínimamente contar con un plan de tesis, un asesor de tesis que haya aceptado asesorar la propuesta y se evalúa la experiencia previa en investigación.', 17),
(0, '2.11.17.70 Formato de Renovación de Licenciamiento R-C1 “Mallas curriculares”. El formato debe estar firmado por el representante legal\r\nde la universidad.', 17),
(0, '2.11.17.71 Documento, firmado por la autoridad competente, que contenga la descripción del estudio y los procedimientos de consulta a estudiantes, docentes, egresados y otros actores estratégicos definidos por el programa, utilizados para la revisión del plan de estudios, y su consiguiente ratificación o modificación. Se describe la fundamentación y metodología empleada para estructurar el plan, teniendo en cuenta los ámbitos económicos, académicos, sociales, culturales, científicos y tecnológicos, en los que busca tener influencia el programa, así como su relación con los Objetivos del Desarrollo Sostenible. Este documento puede ser el propio plan de estudios.\r\n*Para programas con componente semipresencial o a distancia, la fundamentación incluye: la naturaleza teórica y/o práctica de la asignatura y la pertinencia de la modalidad del curso con los contenidos; así como si en caso haya un componente práctico en los cursos y se brinde de forma semipresencial o distancia, se presenta una justificación de la idoneidad de dicho modo para desarrollar las competencias esperadas y se evidencia que se cuenta con los recursos necesarios para ello (programas especializados, laboratorios remotos, simulaciones, realidad aumentada, entre otros).\r\n**Para universidades interculturales o con programas interculturales, se evidencia la participación de las comunidades indígenas, definidas por el programa como actores estratégicos, en el proceso de revisión.', 17),
(0, '2.11.17.72 . Para cursos con componentes prácticos, deberá presentar sílabos, guías de práctica o documento similar que precise y desarrolle dicho componente, detallando el uso de laboratorios, talleres, equipamiento, softwares u otros recursos informáticos similares que son necesarios para el correcto desarrollo de los cursos.', 17),
(0, '2.11.17.73 En caso sean programas de doctorados, informe y evidencias de ejecución de la estrategia (del año anterior a la solicitud) de investigación proporcional al número de profesores y estudiantes, diseñados para promover la excelencia en la investigación, la cooperación en las actividades, garantizar la objetividad e imparcialidad en la evaluación, y con criterios trasparentes. Se encuentra detallada para cada programa. En esta se detalla lo siguiente mínimamente:\r\na) Se detalla las estrategias de movilidad académica para la presentación de resultados en congresos nacionales o internacionales o pasantías de investigación tanto para investigadores y estudiantes o estadías doctorales, así como alianzas y redes vinculadas a la investigación (y de acuerdo con la naturaleza del programa, articulación con el entorno-sector productivo), que establecen pasantías y estancias de estudiantes, así como la realización de investigación conjunta.\r\nb) Se detalla la estrategia de participación de los doctorandos en los proyectos, grupos o centros de investigación de la universidad.\r\nc) Se detalla las estrategias para promover la publicación y difusión de los trabajos de investigación, de acuerdo a estándares de imparcialidad y objetividad\r\nd) Se detalla las estrategias de acompañamiento, seguimiento y evaluación permanente desde el inicio de la investigación que realiza el doctorando. La modalidad de la implementación de las estrategias es pertinente con el enfoque de investigación del programa y las competencias en investigación requeridas en el área del conocimiento, campo profesional, tecnológico o técnico en el que se inserta.\r\n*De ser el caso, aplica por sede o filial.', 17),
(0, '2.11.17.74 En caso se pretenda crear un nuevo programa de estudios, deberá presentar un documento o informe que sustente su relevancia y pertinencia, con una base teórica y metodología verificable y con datos provenientes de fuentes primarias o secundarias. Debe tener, como mínimo, el siguiente contenido:\r\n(i) Determinar y justificar el ámbito de influencia del programa (donde las actividades del programa o los egresados del mismo generarán impacto).\r\n(ii) Estudio de la demanda laboral (potencial e insatisfecha) o posibilidades de colocación laboral.\r\n(iii) Estudio de la demanda y oferta formativa similar existente en el ámbito de influencia y su impacto en el ámbito laboral de los egresados del programa.\r\n(iv) Justificación de la pertinencia social, cultural o académica de la propuesta (o pertinencia con las políticas nacionales, internacionales o regionales).\r\n(v) Justificación sobre la existencia de referentes en el ámbito nacional e internacional en torno a la propuesta académica.\r\n(vi) De ser el caso, relevancia y pertinencia de ofrecerlo en modalidad semipresencial y/o a distancia.', 17),
(0, '2.11.17.75 Reglamento aprobado por la autoridad competente en el que se normen las equivalencias entre horas lectivas presenciales, horas lectivas no presenciales y otro tipo de cargas de trabajo formativa que se desarrollen con el fin del logro de aprendizajes.', 17),
(0, '2.12.18.76 Tabla que contiene la lista codificada del acervo bibliográfico físico disponible en la biblioteca para los estudiantes. Se evidencia que se cuenta con acervo para todos los programas presenciales o semipresenciales. Incluye la lista de material complementario como colecciones artísticas y no artísticas, documentos históricos, u otro tipo de material documentario. La información contiene como mínimo el siguiente detalle:\r\n- Código\r\n- Título de la obra\r\n- Autor(es)\r\n- Área del conocimiento vinculado a ese título.\r\n- Tipo de material documentario (es decir, si es un libro, revista, documentación histórica, colección artística, etc.)\r\n- Programas académicos vinculados a ese título (de corresponder)\r\n- Año de publicación\r\n- Locales en los que está disponible ese título\r\n- Número de ejemplares', 18),
(0, '2.12.18.77 Contratos o convenios vigentes del uso de servicios de bibliotecas virtuales, y contratos de suscripciones a bases de datos bibliográficas (ejemplos, WOS, SCOPUS, etc.). Matriz con el detalle de las características de las bases de datos bibliográficas a las que se accede por suscripción, con el siguiente contenido:\r\n- Nombre de las suscripciones a bases de datos/catálogos bibliográficos.\r\n- De forma resumida, detallar las principales características de la(s) base(s) de datos, como a qué tipo de material bibliográfico te permite acceder, si es netamente en un idioma o varios, etc.\r\n- Fecha de inicio / final de la suscripción (en el formato dd/mm/aaaa).\r\n- Especificar si la base de datos está habilitada en la sede y las filiales (de corresponder).\r\n- Comentarios (de corresponder).', 18),
(0, '2.12.18.78 Documento(s), aprobado(s) por la autoridad competente, que establezca(n) las estrategias (infraestructura, gestión de calidad, financiamiento, entre otros) de la universidad o escuela de posgrado para la actualización y la mejora continua de sus centros de información y referencia, de acuerdo con los parámetros definidos por la propia institución. Deberán incluirse las estrategias de la implementación progresiva para contar con materiales accesibles para las personas con discapacidad, de acuerdo con la normativa vigente.', 18),
(0, '2.12.19.79 Manual de usuario que contenga la indicación del enlace de la plataforma de interacción y que describa las siguientes funciones mínimas en la plataforma:\r\n- Inducción al uso de plataforma virtual.\r\n- Uso de diversos instrumentos de participación individual y grupal para el logro del aprendizaje como intercambio de archivos entre alumnos y docentes, desarrollo de foros y chat en vivo, entre otros.\r\n- Uso de diversos instrumentos para la evaluación del logro de las competencias profesionales y capacidades académicas que se van adquiriendo a través de las asignaturas del currículo, como evaluaciones y encuestas en línea.\r\n- Acceso a material didáctico.\r\n- Comunicación sincrónica/ asincrónica con el docente.\r\n- Desarrollo de videoconferencias que permitan también la comunicación escrita entre los participantes. Puede desarrollarse a través de otra plataforma.\r\n- Evidencia el monitoreo y/o seguimiento del uso y efectividad del sistema en el proceso de enseñanza-aprendizaje, centrándose en las actividades y de toda la interacción con/del estudiante\r\n- Emisión de reportes sobre el cumplimiento de las actividades\r\n- Mecanismos adecuados para el acceso de estudiantes con discapacidad a través de estrategias instructivas alternativas y/o remisión a recursos institucionales especiales.\r\nSe evidencia que la plataforma se encuentra integrada o es interoperable, como mínimo, con los sistemas de registros académicos y de matrícula. Asimismo, se evidencia que se tiene un ancho de banda adecuado que garantice la accesibilidad y disponibilidad (indicador 13)', 19),
(0, '2.12.19.80 Documento de gestión académica en donde se especifiquen los procedimientos y cronología del monitoreo de las actividades académicas y administrativas en la plataforma virtual por parte del personal a cargo de la plataforma.\r\n*En caso de que se cuente con programas a distancia, se cuenta con protocolos y procedimientos de atención permanente (durante las 24 horas) para todo el período académico a los estudiantes y docentes, así como de soporte técnico a la operación del sistema.', 19),
(0, '2.12.19.81 Usuarios y contraseñas de todos los perfiles (administrador, estudiante, docente, egresado) que tiene el(los) sistema(s) de aprendizaje virtual.', 19),
(0, '2.12.19.82 Contratos de arrendamiento o licencia de implementación de la plataforma, en caso aplique, de por lo menos un (01) año.', 19),
(0, '2.12.19.83 Documento que contenga estrategias y mecanismos preventivos y de control a nivel de identificación de los estudiantes, trabajos y evaluaciones con el fin de evitar el fraude, plagio y suplantación.', 19),
(0, '2.12.19.84 En caso cuente con programas semipresenciales y/o distancia o sea una Escuela de Posgrado, deberá evidenciar que cuenta con un área encargada de la gestión de los entornos de enseñanza-aprendizaje virtual (medio de verificación 1.2.2.3). Puede ser un área específica u alguna que cumpla otras funciones adicionales. Esta área tiene como mínimo las siguientes funciones:\r\n(i) Adaptación de los contenidos de los cursos para entornos no presenciales de aprendizaje, de ser el caso, en conjunto con los docentes.\r\n(ii) Producción y difusión de materiales didácticos.\r\n(iii) Capacitación y apoyo a docentes y estudiantes, en el uso de los entornos no presenciales de enseñanza.\r\n(iv) Gestión y mantenimiento del hardware y software necesarios. En caso la universidad decida subcontratar procesos, el órgano se encargará de su supervisión, definiendo estándares mínimos de calidad.\r\n(v) Seguimiento, evaluación y mejora continua de los procesos asociados a los entornos no presenciales de aprendizaje, articulados con los procesos de gestión de la calidad a nivel institucional.\r\n*De corresponder, se establece cómo opera tanto a nivel sede como a nivel de las filiales', 19),
(0, '2.12.19.85 En caso cuente con programas semipresenciales y/o distancia, documento que contenga lineamientos y procedimientos para el diseño y producción de materiales, de acuerdo con los objetivos de los programas académicos. Dicho documento está aprobado por autoridad competente e incluye como mínimo disposiciones referidas a:\r\n(i) Tipo de materiales didácticos que pueden ser usados (presentaciones, videos, etc.)\r\n(ii) Estándares que deben cumplir los materiales.\r\n(iii) Responsables del diseño y la producción de los materiales.\r\n(iv) Estrategias de capacitación en el diseño y producción de los materiales.', 19),
(0, '2.13.20.86 Documento(s) aprobado(s) por la autoridad competente, que establece(n) la estrategia de admisión (de ser el caso, pudiendo ser diferenciada entre sede o filial) regida por criterios de meritocracia308 y equidad e inclusión309, con estándares de rigurosidad que garanticen el acceso sobre la base de la capacidad de cada persona, en condiciones de equidad310, para desarrollar las competencias profesionales que los programas persiguen311 y que aseguren la capacidad institucional para brindar servicios de calidad a los nuevos estudiantes312. En ella, se detalla el perfil de ingreso o perfiles de ingreso, así como los mecanismos de preparación y evaluación de los procesos de admisión tomando como referencia el perfil de egreso de la educación básica y de los postulantes. Incluye también los criterios para la determinación de vacantes.\r\n*En el caso de universidades interculturales o con programas interculturales, incluye estrategias para la incorporación de estudiantes indígenas313.\r\n**De ser el caso, y si el modelo educativo de la universidad así lo establece, se cuenta con estrategias y criterios para evaluar, reconocer y certificar aprendizajes adquiridos a lo largo de la vida de las personas en cualquier espacio, incluyendo los entornos virtuales, durante el desarrollo de actividades productivas y formas no tradicionales de aprendizaje314 para la admisión. Estas estrategias y criterios a la vez se aseguran de que cumplan con el perfil de ingreso.\r\n***En caso se cuente con programas de doctorado, se evidencia que se cuenta con una estrategia que incluye procedimientos de admisión, que se rijan por criterios de meritocracia y rigurosidad intelectual que garanticen el acceso sobre la capacidad de cada uno para desarrollar las competencias exigidas por el programa y que aseguren la capacidad del programa (recursos, docentes, entre, otros) para cumplir con sus objetivos académicos. Mínimamente, una evaluación del candidato por una comisión académica, con regulación sobre los criterios académicos para la conformación de dicha comisión. En el marco de la autonomía académica de la universidad, se exige, entre otros, o una propuesta de investigación sólida, o cartas de recomendación, o experiencia previa en investigación, o la aceptación por parte de un asesor, o una maestría pertinente al área del programa, o así como se puede contar con una comisión académica compuesta por cinco o más miembros con trayectoria reconocida en investigación (profesores doctores internos y externos además del coordinador del programa) que evaluaría la postulación, o la combinación entre dos (2) o más de estas opciones.', 20),
(0, '2.13.20.87 De ser el caso, según el perfil de ingreso y la orientación de la universidad, documento(s) de gestión donde se definan los procesos de nivelación de la universidad, que parten desde la identificación de las brechas entre el perfil de egreso escolar y el perfil de ingreso de sus admitidos o alguna otra brecha definida a partir de criterios académicos o de atención prioritaria a grupos en situación de vulnerabilidad.\r\n* En el caso de universidades interculturales o con programas interculturales, incluye ciclos propedéuticos para estudiantes indígenas.\r\n** Los procesos de nivelación pueden variar entre filiales, de ser el caso.', 20),
(0, '2.13.20.88 Documento normativo(s) que regule la evaluación del aprendizaje para los distintos programas ofertados (pregrado y posgrado en caso corresponda). Contempla lineamientos sobre número de evaluaciones en el ciclo y plazos de devolución de correcciones. Aprobado(s) por la autoridad competente.', 20),
(0, '2.13.20.89 Documento(s) de gestión dónde se establece el procedimiento de seguimiento al desempeño de los estudiantes de pregrado (de todas las modalidades de estudio), a fin de identificar problemas en el avance esperados y ejecutar acciones para superarlo; con prioridad en los grupos en situación de vulnerabilidad. Aprobado(s) por la autoridad competente.\r\n*En caso cuente con programas de doctorado, se cuenta con un servicio de soporte académico específico y especializado para los mismos. De ser el caso, aplica por sede o filial.\r\n**No aplica para Escuelas de Posgrado.', 20),
(0, '2.13.20.90 En caso cuente con programas de doctorado, en el reglamento de grados y títulos o documento equivalente se norma los mecanismos de evaluación de las investigaciones de los estudiantes (mínimamente, tesis de grado, asegurando la sustentación pública de la misma, con los requisitos previos académicos para ello) y los criterios académicos para la selección de jurados evaluadores (mínimamente, el de tesis), los mismos que cuentan con experiencia en investigación, orientándose a garantizar principios de objetividad e imparcialidad316 y transparencia317. Dentro de los mecanismos se incluye el acompañamiento, seguimiento y evaluación permanente desde el inicio del proceso de elaboración de la investigación y se orienta asegurar la realización de un producto de investigación publicado, vinculado a la tesis. Se regula el procedimiento para el diseño, elaboración, sustentación, aprobación y publicación de la tesis. Para poder graduarse, mínimamente se exige la publicación de un (1) publicaciones en revistas indizadas en Wos o Scopus. Además, para sustentar se tiene una aprobación previa, de al menos 2 miembros del jurado; los mismos que elaboran un informe redactado de la tesis, y las razones por las cuales el trabajo puede pasar a sustentación. Se establece que mínimamente en el jurado participa un experto externo a la institución, regulando los criterios académicos para la selección de este.\r\nEn el marco de la autonomía académica de la universidad o escuela de posgrado, la institución puede establecer como requisito: más publicaciones previas o la aprobación de un examen de competencias o de calificación. El trabajo puede ser presentado en formato de: a) un solo documento o b) un compendio de tres artículos publicados en revistas indexadas en Wos. En el caso del compendio, tiene una introducción en la que se presenten las publicaciones y se justifique la unidad temática de los mismos para conformar una tesis, un resumen global de los resultados, la discusión de estos resultados, las conclusiones finales y una copia de las publicaciones que forman parte de la tesis. El jurado evaluador puede estar conformado por un equipo de docentes de al menos cinco personas (con grado de doctor) entre titulares y suplentes, nacionales y/o extranjeros, vinculados a universidades u organismos de investigación, y con experiencia investigadora reciente acreditada.', 20),
(0, '2.13.20.91 Informe y evidencias de ejecución de los procesos de admisión, nivelación (según corresponda) y seguimiento al desempeño, de acuerdo con las estrategias planteadas, correspondientes al último año previo a la presentación de la solicitud de renovación.', 20),
(0, '2.14.21.92 Formato de Renovación de Licencia R-C9 sobre la plana docente. El Formato debe estar firmado por el representante de la universidad.\r\n*En el caso de universidades interculturales o que brinden programas interculturales, se orienta a contar con docentes de origen indígena o con competencias interculturales. En el formato se señala en la columna “Comentarios” los docentes que tengan tal perfil.\r\n**En caso cuente con programas de doctorado, se evidencia que se cuenta con una plana docente en proporción al enfoque de investigación y a las necesidades de acompañamiento de los estudiantes. Al menos el 60% de los asesores de tesis son profesores que dictan o han dictado en el programa o en otros programas de doctorado de la universidad. Se evidencia que al menos el 30% de los docentes de cada programa cuenta con un posgrado obtenido en una universidad distinta a la institución donde se dicta.\r\n***En caso se pretenda crear nueva oferta, se evidencia que se cuenta con docentes encargados de la gestión académica y curricular de los programas para los dos (2) primeros años.', 21),
(0, '2.14.21.93 Currículos vitae, contratos, resoluciones de nombramiento o contratación, carga horaria, según corresponda, de una muestra aleatoria de los docentes de la universidad. La muestra seleccionada se pedirá conforme avance el procedimiento.\r\n*En caso cuente con programas de doctorado, se presenta para evidencias de los docentes que acrediten su experiencia en investigación en los términos definidos en el indicador 24.', 21),
(0, '2.14.21.94 Reglamento o documento normativo (este reglamento puede estar incluido en los que se presentarán en el indicador 23) que regule las horas lectivas y no lectivas de los docentes, que permita garantizar el desarrollo de las otras actividades concernientes, como la investigación, la gestión universitaria, la asesoría académica, la proyección social. Las horas lectivas asignadas deben permitir cumplir con la finalidad académica y pedagógica del docente. Incluye también criterios para la determinación de la ratio entre estudiantes y docentes (95)', 21),
(0, '2.14.22.95 Documento (s), aprobado por la autoridad competente, que contenga la Política de desarrollo profesional y académico del cuerpo docente dentro de la institución y/o el programa de estudio, orientada al desarrollo de competencias pedagógicas y académicas, con fines de promoción, abordar la problemática generacional, acceso a puestos de gestión, bonificaciones y reconocimientos. Incluye estrategias o lineamientos para promover la equidad de género en el cuerpo docente y en las autoridades. Debe contener como mínimo: i) base legal, ii) objetivos y iii) lineamientos y estrategias.', 22),
(0, '2.14.22.96 Plan(es) aprobado (s) por la autoridad competente, donde se detalle cada uno de los programas de desarrollo profesional y académico para los docentes (talleres; cursos; programas de movilidad, intercambio y pasantía; programas de capacitación, actualización, especialización y formación continua; participación en congresos; programas de formación en posgrado; programas de formación para iniciar labores de docencia en la universidad; entre otros). Se incluye como mínimo: i) los objetivos de cada programa,\r\nii) descripción y justificación del programa, iii) criterios de selección, de corresponder, para el acceso a los programas, iv) presupuesto por programa, v) fuentes de financiamiento, vi) responsables, vii) metas o resultados esperados y viii) cronograma de ejecución. Incluye capacitaciones en temática de inclusión (mínimamente, en temas sobre discapacidad, en aspectos relacionados a las adaptaciones curriculares, metodológicas, materiales y de evaluación) y de equidad (mínimamente, en temas sobre género).\r\n*En el caso de las universidades públicas, el (los) plan(es) debe(n) vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.\r\n**Incluye a la sede y filiales donde se desarrollarán, en caso corresponda.\r\n***En el caso de universidades interculturales o con programas interculturales, incluye estrategias de capacitación en el enfoque intercultural319.\r\n****En el caso de universidades con programas semipresencial y/o distancia, o Escuelas de Posgrado, mínimamente se orienta a la capacitación en metodologías de uso de las TIC, el manejo de entornos virtuales de aprendizaje, el fomento de nuevos enfoques metodológicos y pedagógicos en dichos entornos y la capacidad para mejorar los recursos pedagógicos y didácticos. Mínimamente alcanza a los docentes vinculados con los entornos de aprendizajes no presenciales de todos los programas semipresenciales y/o a distancia.', 22),
(0, '2.14.22.97 Documento(s), aprobados por la autoridad competente, que desarrolla(n) los instrumentos institucionales para reconocer y promover las buenas prácticas docente, entre los que se incluyen premios, reconocimientos y apoyo a: i) buenas prácticas pedagógicas;\r\nii) proyectos de innovación pedagógica, didáctica o de evaluación; iii) comunidades docentes de aprendizaje, orientadas a la reflexión sobre la práctica docente.', 22),
(0, '2.14.22.98 Informe y evidencias de la implementación de los programas de desarrollo profesional y académico, de los últimos dos (2) años y del año de la presentación de la solicitud.\r\n*De ser el caso, se detalla por sede o filial.', 22),
(0, '2.14.23.99 Reglamento(s) u otros documentos normativos actualizados que regulen la gestión docente, en los que se describan detalladamente los procesos, en base a criterios meritocráticos y una lógica de resultados, de contratación, ingreso, nombramiento, promoción, ratificación y separación de la carrera docente. En los mismos se definen los roles y perfiles de los docentes, de acuerdo con la naturaleza del programa y a la modalidad en la que dicta321. Se incluyen mecanismos para el manejo de conflictos de interés en ratificaciones y promociones, y comisiones de evaluadores pares. Además, incluye los procedimientos, criterios e instrumentos de evaluación para todos los procesos de la gestión docente, guiados por principios de imparcialidad, meritocracia y una lógica de resultados, los mismos que incluyen la evaluación también por parte de los estudiantes. Se regula también los derechos y deberes de las distintas categorías docentes (especificándose los que respecto a los docentes a dedicación exclusiva).\r\n*En caso cuente con programas de doctorado, se norma el rol del asesor de tesis; cuyas funciones se orientan mínimamente a guiar al estudiante en las actividades de formación, guiar en la planificación y participación en actividades vinculadas al programa, ser soporte en las necesidades formativas del estudiante (metodología, gestión del proyecto de tesis, acompañamiento en la edición de esta). Se establece como requerimiento mínimo el que cuente con experiencia en investigación en los términos definidos en el indicador 23. Se establece un mecanismo para la asignación de horas lectivas de los asesores, de forma que se garantice su rol de acompañamiento; así como los criterios para la asignación de tesis asesora, de forma que se garantice acompañamiento personalizado.', 23),
(0, '2.14.23.100 Documento, aprobado por la autoridad competente, que contiene la Política institucional para el fortalecimiento de la carrera docente, articulada con la política de desarrollo profesional del docente y los programas académicos, que define mínimamente: a) cómo se entiende la carrera del docente dentro de la universidad; b) las estrategias para promover la meritocracia a nivel de los docentes (incentivos); c) estrategias para incentivar el ingreso y la retención de los docentes así como para un adecuado flujo de ingreso/salida en el cuerpo docente; y d) las estrategias para abordar la problemática generacional en el cuerpo docente. Puede ser integrada con la política de desarrollo profesional y académico del docente.', 23),
(0, '2.14.23.101 Evidencias de los procesos de ingreso, nombramiento, promoción, renovación de contratos, ratificación y separación del profesorado, de los dos (2) últimos años y del año de la presentación de la solicitud de renovación.\r\n*De ser el caso, se detalla por sede o filial.', 23),
(0, '3.15.24.102 Formato de Renovación de Licencia R-C9 sobre la plana docente, señalando los que son Renacyt y los que realizan investigación322. El formato debe estar firmado por el representante legal. La universidad o escuela de posgrado garantiza que estos representan al menos el 3% del total de docentes, en tanto que se compromete al incremento gradual de dicho porcentaje durante todo el periodo de su renovación de licenciamiento institucional, excepto en el caso de aquellas instituciones que hayan obtenido el mayor puntaje posible en los indicadores de gradualidad para el cálculo de los años de renovación, correspondientes al componente de investigación.\r\n*En caso sea una universidad intercultural, en el formato se incluye a los sabios y sabias que realizan investigación con apoyo institucional323. Para ello, la universidad debe haber regulado sobre los requisitos para ser reconocidos como tales y los mecanismos de participación de estos.\r\n**En caso cuente con programas de doctorado, se evidencian que al menos el 30% de la plana de cada programa es Renacyt o docente que realiza investigación. Estos participan en centros de investigación y/o grupos de investigación y/o tienen proyectos de investigación a su cargo, reconocidos institucionalmente. Asimismo, evidencia contar con un 7% del total de docentes a nivel institucional en categoría Renacyt y al menos el 40% de los mismos son a tiempo completo.\r\n***De ser el caso, aplica por sede o filial', 24),
(0, '3.15.24.103 Documento normativo que regula el perfil del docente que realiza investigación e investigadores, sus funciones, responsabilidades, derechos y deberes, así como el rol que asumirá para el desarrollo de la investigación en la universidad. Debe incorporar los procesos de selección, evaluación de desempeño, reconocimientos, incentivos y promoción de los docentes investigadores. Se orienta a promover que los investigadores sean gestores del conocimiento, asesores, líderes de grupos de investigación y de los proyectos de investigación y que participen en fondos concursables y pasantías de investigación.', 24),
(0, '3.15.24.104 Plan de atracción, contratación, formación (continua o post-doctoral324 según corresponda), promoción y retención de los docentes que realizan investigación e investigadores, con un horizonte mínimo de dos (2) años y aprobado por la autoridad competente. Este plan debe contar como mínimo con: i) objetivos con sus respectivos indicadores y metas, ii) actividades, metas y resultados que se quieran alcanzar iii) cronograma específico, iv) presupuesto total y desagregado por partidas y subpartidas, v) número de docentes esperados según nivel y categoría Renacyt, vi) responsables de la ejecución del plan; vii) fuentes de financiamiento, viii) incentivos por resultados y/o productos. El plan se basa en un diagnóstico del estado situacional del cuerpo docente dedicado a la investigación y puede estar incorporado en otros documentos de planificación institucional. Se orienta al aumento progresivo del porcentaje de docentes renacyt respecto al total del cuerpo docente.\r\n*En el caso de las universidades públicas, el Plan debe vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.\r\n* De corresponder, se debe especificar la implementación a nivel de sede y filial.', 24),
(0, '3.15.24.105 Informe y evidencias de la ejecución del plan, la implementación del proceso de selección de docentes investigadores y las funciones que desarrollan en la universidad, detallando las actividades que realiza en la universidad y los proyectos de investigación a cargo, de los dos (2) últimos años y del año de la presentación de la solicitud de renovación. Incluye el detalle de sede y filiales, en caso corresponda.', 24),
(0, '3.16.25.106 Documento(s) normativo(s), aprobado (s) por la autoridad competente, que regule(n), a nivel institucional, los procedimientos para la realización y fomento de la investigación, así como la calidad, integridad científica con comités de ética y los derechos de propiedad intelectual. Define(n) y regula(n) las alternativas o formas de investigación, innovación y/o producción artística-cultural, de acuerdo a los fines de la universidad o escuela de posgrado.', 25),
(0, '3.16.25.107 Documento(s) normativo(s), aprobado(s) por la autoridad competente, que regule(n) como mínimo: i) concurso, postulación, evaluación y monitoreo de proyectos de investigación, innovación y producción artística-cultural, cuyos procesos como mínimo incluyen evaluación de pares externos; ii) adjudicación y monitoreo de fondos de investigación, innovación y producción artística-cultural (garantizando la independencia de los evaluadores y/o examinadores); iii) procedimientos y estándares para la comunicación de resultados a través de publicación, exposición, difusión y/o registro de los proyectos de investigación, innovación y/o creación artística- cultural; iv) los mecanismos para el desarrollo de sus líneas de investigación (concursos, semilleros, grupos, entre otros. Respecto a los grupos, regula su conformación, derechos, deberes, beneficios); v) definición de los derechos y responsabilidades de cada miembro de la comunidad universitaria en materia de innovación y producción artística-cultural; vi) código de ética y/o integridad científica; vii) propiedad intelectual; viii) procedimientos para el desarrollo de investigaciones o competencias vinculadas a la investigación en estudiantes; ix) procedimientos para la trasferencias de conocimientos; x) resolución de disputas.\r\nEn ellos, se regula procedimientos para la evaluación de la calidad orientados a la publicación y/o exposición de los productos y/o resultados de investigación, innovación, y/o producción artística-cultural. Estos son consistentes con los campos del conocimiento de la educación en los que se enmarca la actividad de la universidad; así como sus propósitos institucionales325. Incluyen la revisión de pares externos, y de actores pertinentes de acuerdo con la orientación del proyecto326 y la publicación de dicha evaluación, en caso sea favorable. Son complementarios a los procedimientos externos de evaluación de investigación, innovación, y/o producción artística- cultural.', 25),
(0, '3.16.25.108 Informe y evidencias de la implementación y cumplimiento de el/los instrumentos normativos que regule(n), a nivel institucional, los procedimientos para la realización y fomento de la investigación y transferencia de conocimientos, así como la calidad, integridad científica y los derechos de propiedad intelectual, de los dos (2) últimos años y del año de la presentación de la solicitud de renovación.\r\n*De ser el caso, la evidencia es tanto para sede o filial.', 25),
(0, '3.16.26.109 Documento que contiene la Política General de Investigación, innovación, producción artística y/o cultural y/o transferencia de conocimientos de alcance institucional y aprobado por la autoridad competente, que incluye como mínimo: i) definición, enfoque y tipo de investigación que propone desarrollar (formativa, científica, artística-cultural, entre otras) con sus políticas específicas respectivas;\r\nii) objetivos generales para el desarrollo de la investigación; iii) misión y visión referente al desarrollo de la investigación; iv) actores de la comunidad involucrados en investigación; v) fondos y estrategias para la trasferencias de conocimiento, estableciendo pautas u orientaciones; vi) para ello y los actores fondos y estrategias para el apoyo a los investigadores, participación en eventos y congresos de investigación, pasantías de investigación, iniciación científica, fomento de publicaciones, profesores visitantes, becas de posgrado, apoyo a tesis de investigación, entre otros, de acuerdo al enfoque de investigación de la universidad o escuela de posgrado. Incluye política de conocimiento abierto, de promoción de la participación de mujeres en las investigaciones, de participación en y con el entorno en la generación de saberes, y de medición del impacto social de sus investigaciones, vinculado a su Política de Responsabilidad Social.\r\n*En el caso de universidades interculturales, la Política incluye la promoción de la investigación intercultural, orientada a promover una ecología de saberes, así como la realización de investigación en conjunto con los pueblos indígenas327.\r\n**En el caso de las Escuelas de Posgrado o programas de doctorado, se incluye Becas, premios de investigación o estrategias de financiamiento de las investigaciones, a las que tienen posibilidades de acceder los estudiantes.', 26),
(0, '3.16.26.110 Plan para el desarrollo de la investigación, con un horizonte mínimo de dos (2) años y aprobado por la autoridad competente, que contiene como mínimo: i) objetivos generales y específicos; ii) metas, actividades, resultados e indicadores; iii) cronograma detallado de ejecución mensual; iv) responsables de ejecución para el logro de objetivos; v) presupuesto detallado por partidas específicas y subespecíficas; vi) descripción de las fuentes de financiamiento (indicado si son internas o externas); vii) descripción detallada de los niveles implementación del plan (investigación centralizada o por programa). Puede ser incluido dentro de instrumentos de planificación institucional.\r\n*En el caso de las universidades públicas, el plan debe vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.\r\n**De ser el caso, incluye sedes y filiales.\r\n***En caso cuente con programas de doctorado, el plan comprende los proyectos de investigación esperados para la participación de los estudiantes, las medidas de apoyo que se otorgarán, así como las estrategias establecidas para cada programa que se desarrollarán.', 26),
(0, '3.16.26.111 Presupuesto de investigación ejecutado de los dos (2) años previos, y proyectado a cinco (5) años, aprobado por la autoridad competente, detallado por cada mecanismo de desarrollo de investigación y actividades programadas en la política, los instrumentos de gestión y planificación (especificando equipamiento, personal, materiales, entre otros). Se articula con lo presentado en los indicadores 6 y 7.\r\n*En el caso de las universidades públicas, el presupuesto debe vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.\r\n**De ser el caso, incluye sedes y filiales.\r\n***En caso cuente con programas de doctorado, detalla las partidas para los proyectos de investigación, medidas de apoyo a los estudiantes, así como para la implementación de las estrategias establecidas para cada programa. De ser el caso, aplica por sede o filial.', 26),
(0, '3.16.26.112 Informe y evidencias de la implementación de la Política General de Investigación, innovación y/o creación artística y cultural y las actividades programadas en la planificación para el desarrollo de la investigación, así como la obtención de los resultados esperados y el cumplimiento de las metas establecidas, de los dos (2) últimos años y del año de la presentación de la solicitud de renovación.\r\n*De ser el caso, tanto para sede y/o filial.', 26),
(0, '3.17.27.113 Documento que contenga las líneas de investigación y grupos de investigación que se están desarrollando. Aprobado por la autoridad competente.\r\n*En el caso de universidades interculturales o con programas interculturales, cuenta con líneas de investigación sobre conocimientos indígenas y problemática de los pueblos indígenas.', 27),
(0, '3.17.27.114 Documento(s) que evidencien la articulación entre las líneas con los recursos humanos (investigadores, grupos, centros o institutos de investigación, entre otros), físicos (infraestructura, laboratorios y equipamiento) y financieros. Aprobado por la autoridad competente. Se evidencia que las líneas o grupos cuentan con líderes Renacyt y/o experiencia relevante en el campo de investigación.', 27),
(0, '3.17.27.115 Documento(s) que evidencien el proceso de identificación, priorización y aprobación de las líneas de investigación, de acuerdo con la guía práctica para la identificación, categorización, priorización y evaluación de líneas de investigación-Resolución de Presidencia N° 115-2019-CONCYTEC-P o normativa aplicable vigente.\r\n*En caso cuente con programas de doctorado, se evidencia que están adscritos a líneas de investigación consolidadas o por consolidar. Excepcional, el programa puede no hallarse vinculado a una línea de investigación consolidada o por consolidar, si cumple con los siguientes requisitos: a) es en un área de investigación inédita para la universidad; b) tiene un cuerpo de docentes donde al menos el 50% es Renacyt con publicaciones el área; c) cuenta con financiamiento externo que asegura la sostenibilidad en el tiempo de las labores de investigación.\r\n**De ser el caso, aplica por sede o filial.', 27);
INSERT INTO `medio` (`id`, `detalle`, `id_criterio`) VALUES
(0, '3.17.27.116 Formato de Renovación de Licencia R-C16 que contiene el registro de proyectos de investigación ejecutados y en ejecución durante los últimos dos años, detallando sus resultados (publicación en revistas, monografías, ensayos, obras literarias, patentes, prototipos, creación artística y/o cultural, impacto social, trasferencia del conocimiento, entre otros que resulten aplicables). Se evidencia el desarrollo a nivel de sede y filiales. El registro identifica que la institución produce resultados de la investigación, innovación, y/o producción artística-cultural que han sido publicados, expuestos o registrados, cumpliendo con los requisitos tanto internos como externos, y están articuladas a sus líneas de investigación, demostrando que ha tenido un impacto social local, regional, nacional y/o internacional (pudiendo ser mediante transferencias del conocimiento). El formato debe estar firmado por el representante legal.', 27),
(0, '3.17.27.117 Informe y evidencias de la ejecución de los proyectos de investigación, de acuerdo a los resultados esperados, de los dos (2) últimos años y del año de la presentación de la solicitud de renovación. Además, incluye evidencias sobre el proceso de aprobación e implementación efectiva de pautas de conducta responsable en las investigaciones, de acuerdo con la normativa interna, nacional e internacional que le resulte aplicable.\r\n*De ser el caso, tanto para sede y/o filial.', 27),
(0, '4.18.28.118 Documento(s) normativo(s), aprobado(s) por la autoridad competente, que regule(n) los servicios complementarios que ofrece la universidad, incluye(n) como mínimo, en relación a cada servicio, lo siguiente: i) objetivo del servicio, ii) público objetivo, iii) detalle de los servicios que ofrece, iv) descripción de las áreas o espacios donde se desarrollarán los servicios, v) frecuencia con la que se proporciona el servicio, vi) perfil del personal cargo de brindar el servicio.\r\n*Los servicios se encuentran disponibles en la sede y filiales, en caso corresponda, únicamente para los estudiantes de pregrado, salvo las excepciones que se indican a continuación: i) el tópico se ofrece en todos los locales conducentes a grado de la universidad, y está disponible para todos los miembros de la comunidad universitaria (estudiantes de pregrado y posgrado, docentes, y personal no docente), ii) los servicios de salud mental se encuentran disponibles para estudiantes de pregrado y posgrado, y docentes, iii) las becas y/o programas de asistencia universitaria se ofrecen para estudiantes de pregrado y/o posgrado.\r\n**El programa PRODAC se ofrece de acuerdo con lo dispuesto en la Ley Nº 30476, la cual indica la implementación de tres (3) disciplinas deportivas para hombres y mujeres.\r\n***En el caso de universidades interculturales, incluye servicios de hospedaje y alimentación para estudiantes indígenas', 28),
(0, '4.18.28.119 Contratos del personal a cargo de la ejecución de cada uno de los servicios, de los últimos dos (2) años y del año de la solicitud de la renovación (para los casos de los servicios de salud mental y tutoría corresponde al último año previo a la presentación de la solicitud de renovación). En caso la universidad subcontrate los servicios, debe presentar los convenios suscritos.\r\n*La información se detalla por sede y filial, en caso corresponda.', 28),
(0, '4.18.28.120 Informe y evidencias de ejecución de los servicios complementarios, de los últimos dos (2) años y del año de la solicitud de la renovación (salvo sobre los servicios de saludad mental y tutoría que se evidencia respecto al último año previo a la presentación de la solicitud de renovación) el cual contiene como mínimo el detalle de la información de los servicios ofrecidos, estadísticas y registro de los estudiantes, y docentes, cuando corresponda, que participaron o se beneficiaron con los servicios complementarios ofrecidos. La información se detalla por sede y filial, en caso corresponda.', 28),
(0, '4.18.28.121 En caso se cuente con programas en ciencias de la salud, documento(s), firmado por la autoridad competente, que incluye medidas de prevención de enfermedades infecciosas, como protocolos de vacunación contra la TBC, hepatitis B; y de prevención de VIH-SIDA y TBC, entre otros, para los estudiantes y a todo el personal que haga uso de laboratorios o asistan a prácticas clínicas, de acuerdo a la orientación de los programas.', 28),
(0, '4.18.29.122 Diagnóstico bianual de los factores vinculados a la deserción y la no-graduación de los estudiantes de la universidad. El diagnóstico identifica mínimamente el detalle de las características de los estudiantes que presentan mayores dificultades para culminar sus estudios universitarios.\r\n*De ser el caso, el diagnóstico es diferenciado por sede y filial.', 29),
(0, '4.18.29.123 Plan para la reducción de la deserción y la promoción de la graduación, aprobado por la autoridad competente y con un horizonte mínimo de dos (2) años, el cual incluye un especial énfasis en la atención de los grupos en situación de vulnerabilidad, según lo identificado en el diagnóstico elaborado por la universidad (4.18.29.122). Contiene como mínimo: i) objetivos con sus respectivos indicadores y metas; ii) actividades con sus respectivas metas; iii) cronograma de ejecución mensual; iv) responsables; v) presupuesto por actividades, vi) población objetivo; vii) fuentes de financiamiento.\r\n*En caso corresponda, detalla la implementación de actividades a nivel de sede y filiales.\r\n**En el caso de las universidades públicas, el plan debe vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.', 29),
(0, '4.18.29.124 Documento normativo, aprobado por la autoridad competente, que regula los procesos vinculados a la atención de personas con discapacidad donde se señale los procedimientos de adaptación de los servicios y recursos académicos, y de seguimiento y acompañamiento a su desempeño y bienestar. Garantiza al estudiante con discapacidad la libertad de elección de los distintos formatos y medios utilizables para su comunicación, así como asegura la sostenibilidad de estos.\r\n*En caso se trate de una universidad no intercultural ubicada en una zona con predominio de una lengua originaria, se requiere que los procesos antes mencionados beneficien también a la población indígena de la comunidad.', 29),
(0, '4.18.29.125 Informe y evidencias de ejecución de los servicios orientados a la prevención de la deserción y a la promoción de la graduación, del último año previo a la solicitud de la renovación, el cual contiene como mínimo el detalle de la información de las acciones desarrolladas, estadísticas y registro de los beneficiarios, donde se incluyen los datos de dichas personas.\r\n*En caso corresponda, detalla la implementación de actividades a nivel de sede y filiales.', 29),
(0, '4.19.30.126 Reglamento o instrumento normativo que regule la gestión de los proyectos de relación con la comunidad, en donde se especifique los objetivos, el alcance, los participantes, beneficiarios, los recursos financieros a ser asignados, y los procedimientos para la evaluación de los proyectos, incluyendo la regulación del Servicio social universitario (en el caso de universidades).', 30),
(0, '4.19.30.127 Documento(s) que contengan información sobre los proyectos de relación con la comunidad y el entorno ejecutados y en ejecución durante los últimos dos años y del año de la solicitud de la renovación. El cual contiene como mínimo, para cada proyecto:\r\ni) Objetivo del proyecto y el detalle de su vinculación con los ODS.\r\nii) Descripción del proyecto\r\niii) Población beneficiaria (características y lugar de ejecución),\r\niv) Cronograma (fecha de inicio y fin),\r\nv) Recursos humanos (personal de la universidad involucrado),\r\nvi) Presupuesto asignado y/o ejecutado, según corresponda.\r\nvii) Evaluación de los resultados.\r\nviii) Dificultades y/o propuestas de mejora.\r\nSe evidencian que existen proyectos que son producto o relacionados a los procesos formativos y/o de investigación, co-creados con otros actores externos, con un horizonte mínimo de un año y orientados a generar impactos. Incluye información sobre los proyectos vinculados al Programa de Servicio social universitario. El documento debe estar firmado por el representante legal.\r\n*De ser el caso, se evidencia el desarrollo a nivel de sede y filiales.', 30),
(0, '4.19.131.128 Plan de protección del medioambiente y desarrollo sostenible vigente, con un horizonte mínimo de dos (2) años, y que contenga como mínimo: i) objetivos con sus respectivos indicadores y metas, ii) análisis de sitio y de las problemáticas a tratar; iii) acciones estratégicas con sus respectivos indicadores y metas; iv) actividades específicas con sus respectivas metas, v) cronograma de ejecución de las actividades, vi) responsables y vii) presupuesto por actividades, además de acciones de seguimiento y evaluación de su cumplimiento. Incluye acciones a nivel formativo, investigación, gestión (incluida infraestructura física y tecnológica) y de relación con el entorno. Este Plan debe encontrarse alineado con el Modelo educativo, los objetivos institucionales, la Política Nacional de Educación Ambiental, y en lo que corresponda a los Objetivos de Desarrollo Sostenible. Puede tomar como referencia el Instrumento de Evaluación de Campus sustentable que se usa para la determinación de años de renovación de Licencia.', 31),
(0, '4.19.31.129 Informe y evidencias de las acciones implementadas, en el último año previo y del año de la solicitud de la renovación, para la\r\nprotección del medioambiente y desarrollo sostenible. La información se detalla por sede y filial, en caso corresponda.', 31),
(0, '4.20.32.130 Formato de Renovación de Licencia R-C17 de Registro de egresados, graduados y titulados, a nivel de cada programa de pregrado y posgrado. En caso corresponda, incluyendo situación laboral de por lo menos una muestra representativa de los egresados, graduados y titulados correspondientes a los programas de pregrado, de los dos (2) años anteriores. El formato debe estar firmado por el representante legal de la universidad.\r\n*De ser el caso, la información se presenta nivel de cada local.', 32),
(0, '4.20.32.131 Plan dirigido al recojo, actualización y gestión de la información sobre la situación laboral de sus egresados de todos sus programas de pregrado, aprobado por la autoridad competente y con un horizonte mínimo de dos (2) años; de acuerdo con estándares progresivos de rigurosidad. Este debe contener como mínimo: (i)objetivos con sus respectivos indicadores y metas; (ii) actividades con sus respectivas metas; (iii) cronograma detallado de ejecución mensual; (iv) responsables; (v) presupuesto detallado por actividades; (vi) fuentes de financiamiento\r\n*De ser el caso, debe detallar las actividades por sede y filial.\r\n**En el caso de las universidades públicas, el plan debe vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.\r\n***No aplica para Escuelas de Posgrado.', 32),
(0, '4.20.32.132 Plan dirigido a promover la inserción laboral de sus estudiantes y egresados de programas de pregrado, aprobado por la autoridad competente y con un horizonte mínimo de dos (2) años, que incluya todos los programas de pregrado de su sede y/o filiales. Incluye como mínimo: i) diagnóstico sobre la situación laboral de sus egresados elaborado en base a la información recogida del 4.20.32.131, ii) Objetivos con sus respectivos indicadores y metas; iii) actividades con sus respectivas metas; iv) cronograma detallado de ejecución mensual; v) responsables; vi) presupuesto detallado por actividades; vii) fuentes de financiamiento. La universidad prioriza el desarrollo de acciones dirigidas a los egresados que hayan tenido problemas para incorporarse exitosamente en el mercado laboral, con énfasis en los estudiantes y egresados que pertenecen a grupos en situación de vulnerabilidad identificados por la universidad.\r\n*En el caso de las universidades públicas, el presupuesto debe vincularse con la estructura funcional programática y su correspondiente cadena de gastos hasta el nivel de detalle de específica, por toda fuente de financiamiento.\r\n**En el caso de universidades interculturales, hace especial énfasis en estrategias de inserción laboral para estudiantes y egresados indígenas329.\r\n***No aplica para Escuelas de Posgrado.', 32),
(0, '4.20.32.133 Plataforma virtual de la bolsa de trabajo en portal web oficial disponible para los estudiantes y egresados de los programas de pregrado. Las ofertas laborales disponibles en la plataforma se actualizan, mínimamente, de manera bimestral y consideran a todos los programas de pregrado ofrecidos, y a la sede y filiales, en caso corresponda. La universidad proporciona el enlace, el usuario y la contraseña de acceso.\r\n*No aplica para Escuelas de Posgrado\r\n*De ser el caso, la oferta se encuentra disponible tanto a nivel de la sede como las filiales.', 32),
(0, '4.20.32.134 Informe de evaluación y evidencias de la ejecución de las acciones planificadas en el 4.20.32.131 y 4.20.32.132. Se incluye el detalle de lo ejecutado en los dos (2) últimos años y del año la solicitud de renovación, por sede y filial en caso corresponda.', 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medio_criterio`
--

CREATE TABLE `medio_criterio` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idCriterio` int(11) NOT NULL,
  `medio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idRegistro` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

--
-- Volcado de datos para la tabla `medio_criterio`
--

INSERT INTO `medio_criterio` (`id`, `idCriterio`, `medio`, `idRegistro`, `created_at`, `updated_at`) VALUES
(1, 4, 'mi medio', 1, NULL, NULL),
(2, 1, 'mi mediio', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivelacion`
--

CREATE TABLE `nivelacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tomoExamen` tinyint(1) NOT NULL,
  `resultado` double(8,2) NOT NULL,
  `idRegistro` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

--
-- Volcado de datos para la tabla `nivelacion`
--

INSERT INTO `nivelacion` (`id`, `tomoExamen`, `resultado`, `idRegistro`, `created_at`, `updated_at`) VALUES
(1, 1, 0.00, 2, NULL, NULL),
(2, 1, 0.00, 4, NULL, NULL),
(3, 1, 43.00, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_brecha`
--

CREATE TABLE `nivel_brecha` (
  `id` int(11) NOT NULL,
  `detalle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institucion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `programa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ubicacionGeografica` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RUC` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paginaWebInstitucion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paginaWebPrograma` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `fechaInicio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaAutoevaluacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaEnvio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idUsuario` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id`, `institucion`, `programa`, `ubicacionGeografica`, `RUC`, `paginaWebInstitucion`, `paginaWebPrograma`, `observaciones`, `fechaInicio`, `fechaAutoevaluacion`, `fechaEnvio`, `idUsuario`, `created_at`, `updated_at`) VALUES
(1, 'a', 'a', 'a', 'a', 'a', 'a', 'aaaaaaaaaaaaaaaa', '2022-09-30', '2022-09-30', '2022-09-30', 1, NULL, '2022-12-19 03:45:00'),
(2, 'W', 'Q', 'Q', '204983399101', 'Q', 'WWW.O.COM', NULL, '2022-12-18', '2022-12-18', '2022-12-18', 1, NULL, NULL),
(3, 'aaaaa', 'a', 'a', 'a', 'a', 'a', 'a', '2022-12-28', '2022-12-30', '2023-01-02', 1, NULL, NULL),
(4, 'Juan', 'Michel', 'Tacna', '20498399101', 'o', 'oceanperu.com', 'Ninguna', '2023-12-31', '2023-12-31', '2023-12-31', 1, NULL, NULL),
(5, 'Mi institución', 'Mi programa', 'Mi ubicación geográfica', '332746323478', 'https://www.unsa.edu.pe/', 'https://www.unsa.edu.pe/', 'mis observaciones', '2024-01-23', '2024-01-26', '2024-01-28', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cambioPassword` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `esAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `telefono`, `cambioPassword`, `email_verified_at`, `esAdmin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'administrador', 'admin@email.com', '$2y$10$OrabPAeZRzTBpYAOJDFUleD5B0PYdzVCijFSGtTblVNj7RUmuE7bW', '987654321', 0, NULL, 1, NULL, NULL, '2022-09-22 21:12:10'),
(5, 'Mauricio', 'dx.maoh@gmail.com', '$2y$10$J8ieXQd9EanglX3mIzwlweB/ycYM9XjmZTEboIXg2sxPXbLdQ5cEe', '909090898', 0, NULL, 0, NULL, '2024-01-24 03:48:57', '2024-01-24 03:48:57'),
(6, 'usuario 1', 'usuario1@entiendepiu.com', '$2y$10$EoIEvxHoPxYLyUcMIDmTGOkI4ss46AifFLEw/RFc/G1hd4K1XxAdO', '123456789', 0, NULL, 0, NULL, '2022-10-26 18:41:47', '2022-10-26 18:41:47'),
(8, 'usuario2', 'usuario2@entiendepiu.com', '$2y$10$aZlp6DZZMn7cG27CmzXKcuPfRc1crHp6cxzWHqWJSqzKwCsFlAYpK', '12345678', 0, NULL, 0, NULL, '2022-10-26 18:42:55', '2022-10-26 18:42:55'),
(9, 'usuario3', 'usuario3@entiendepiu.com', '$2y$10$GwbhF9zqAkYS.Wlp8MHgvOyks2ZxyVclMlKx00Zg93GFtQu1QPoge', '12345678', 0, NULL, 0, NULL, '2022-10-26 18:43:11', '2022-10-26 18:43:11'),
(10, 'usuario4', 'usuario4@entiendepiu.com', '$2y$10$hAkiBgKVfa.m/wqzcJnzd.hqDqbuU9xV/k6mEbQbzEepFH4l0n10G', '123456789', 0, NULL, 0, NULL, '2022-10-26 18:43:35', '2022-10-26 18:43:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autoevaluacion`
--
ALTER TABLE `autoevaluacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autoevaluacion_idregistro_foreign` (`idRegistro`);

--
-- Indices de la tabla `brechas_planificacion`
--
ALTER TABLE `brechas_planificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brechas_planificacion_idregistro_foreign` (`idRegistro`);

--
-- Indices de la tabla `brecha_criterio`
--
ALTER TABLE `brecha_criterio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brecha_criterio_idregistro_foreign` (`idRegistro`);

--
-- Indices de la tabla `criterio`
--
ALTER TABLE `criterio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dimension`
--
ALTER TABLE `dimension`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ejecucion_planificacion`
--
ALTER TABLE `ejecucion_planificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ejecucion_planificacion_idregistro_foreign` (`idRegistro`);

--
-- Indices de la tabla `equipo_humano`
--
ALTER TABLE `equipo_humano`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_humano_idregistro_foreign` (`idRegistro`);

--
-- Indices de la tabla `estandar`
--
ALTER TABLE `estandar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factor`
--
ALTER TABLE `factor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `medio_criterio`
--
ALTER TABLE `medio_criterio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nivelacion`
--
ALTER TABLE `nivelacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nivelacion_idregistro_foreign` (`idRegistro`);

--
-- Indices de la tabla `nivel_brecha`
--
ALTER TABLE `nivel_brecha`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registro_idusuario_foreign` (`idUsuario`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autoevaluacion`
--
ALTER TABLE `autoevaluacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `brechas_planificacion`
--
ALTER TABLE `brechas_planificacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `brecha_criterio`
--
ALTER TABLE `brecha_criterio`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `criterio`
--
ALTER TABLE `criterio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `dimension`
--
ALTER TABLE `dimension`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ejecucion_planificacion`
--
ALTER TABLE `ejecucion_planificacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipo_humano`
--
ALTER TABLE `equipo_humano`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estandar`
--
ALTER TABLE `estandar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `factor`
--
ALTER TABLE `factor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medio_criterio`
--
ALTER TABLE `medio_criterio`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nivelacion`
--
ALTER TABLE `nivelacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `nivel_brecha`
--
ALTER TABLE `nivel_brecha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autoevaluacion`
--
ALTER TABLE `autoevaluacion`
  ADD CONSTRAINT `autoevaluacion_idregistro_foreign` FOREIGN KEY (`idRegistro`) REFERENCES `registro` (`id`);

--
-- Filtros para la tabla `brechas_planificacion`
--
ALTER TABLE `brechas_planificacion`
  ADD CONSTRAINT `brechas_planificacion_idregistro_foreign` FOREIGN KEY (`idRegistro`) REFERENCES `registro` (`id`);

--
-- Filtros para la tabla `brecha_criterio`
--
ALTER TABLE `brecha_criterio`
  ADD CONSTRAINT `brecha_criterio_idregistro_foreign` FOREIGN KEY (`idRegistro`) REFERENCES `registro` (`id`);

--
-- Filtros para la tabla `ejecucion_planificacion`
--
ALTER TABLE `ejecucion_planificacion`
  ADD CONSTRAINT `ejecucion_planificacion_idregistro_foreign` FOREIGN KEY (`idRegistro`) REFERENCES `registro` (`id`);

--
-- Filtros para la tabla `equipo_humano`
--
ALTER TABLE `equipo_humano`
  ADD CONSTRAINT `equipo_humano_idregistro_foreign` FOREIGN KEY (`idRegistro`) REFERENCES `registro` (`id`);

--
-- Filtros para la tabla `nivelacion`
--
ALTER TABLE `nivelacion`
  ADD CONSTRAINT `nivelacion_idregistro_foreign` FOREIGN KEY (`idRegistro`) REFERENCES `registro` (`id`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_idusuario_foreign` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
