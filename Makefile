# Created by: Athanasios Douitsis <aduitsis@cpan.org>
# $FreeBSD$

PORTNAME=		unbound_exporter
PORTVERSION=		0.0.1
DISTVERSIONPREFIX=	v
CATEGORIES=		net-mgmt

MAINTAINER=		aduitsis@cpan.org
COMMENT=		Prometheus metrics exporter for the Unbound DNS resolver

LICENSE=		APACHE20

USES=			go
GH_ACCOUNT=		kumina
GH_TAGNAME=		890663c1aad45b5a3c5e1764bf23d6ca880e6d88
USE_GITHUB=		yes

GO_PKGNAME=		github.com/${GH_ACCOUNT}/${PORTNAME}

USE_RC_SUBR=		unbound_exporter

USERS=			unbound
GROUPS=			unbound

STRIP=

PLIST_FILES=		bin/unbound_exporter

pre-build:
	@(cd ${GO_WRKSRC}; ${SETENV} ${MAKE_ENV} ${GO_ENV} ${GO_CMD} get github.com/prometheus/client_golang/prometheus )

.include <bsd.port.mk>
