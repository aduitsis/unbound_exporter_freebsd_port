# Created by: Athanasios Douitsis <aduitsis@cpan.org>
# $FreeBSD$

PORTNAME=		unbound_exporter
PORTVERSION=		0.1
DISTVERSIONPREFIX=	v
CATEGORIES=		net-mgmt

MAINTAINER=		aduitsis@cpan.org
COMMENT=		Prometheus metrics exporter for the Unbound DNS resolver

LICENSE=		APACHE20

BUILD_DEPENDS=		git:devel/git

USES=			go
GH_ACCOUNT=		kumina
USE_GITHUB=		yes

GO_PKGNAME=		github.com/${GH_ACCOUNT}/${PORTNAME}

USE_RC_SUBR=		unbound_exporter

USERS=			unbound
GROUPS=			unbound

STRIP=

PLIST_FILES=		bin/unbound_exporter

pre-build:
	@(cd ${GO_WRKSRC}; ${SETENV} ${MAKE_ENV} ${GO_ENV} ${GO_CMD} get github.com/prometheus/client_golang/prometheus )

do-install:
	${INSTALL_PROGRAM} ${GO_WRKDIR_BIN}/unbound_exporter ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
