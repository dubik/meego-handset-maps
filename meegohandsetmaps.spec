Name:           meego-handset-maps
Version:        0.1
Release:        1%{?dist}
Summary:        Simple and fast maps application for MeeGo Handset. Needs data connection!
Group:          User Interface/Desktops
License:        GPL v2
URL:            https://github.com/dubik/meego-handset-maps
Source0:        file://meego-handset-maps-0.1.tgz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root
BuildRequires:  qt-devel

%description
MeeGo Handset Maps - simple and fast maps application for Handset UX. Uses QtMObility and thus needs data connection to function.

%prep
%setup -q

%build
qmake
make

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/usr/bin/
install -m 755 bin/meegohandsetmaps %{buildroot}/usr/bin/
mkdir -p %{buildroot}/usr/share/applications/
install -m 644 meego-handset-maps.desktop %{buildroot}/usr/share/applications/

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root,-)
/usr/bin/meegohandsetmaps
/usr/share/applications/meego-handset-maps.desktop

%changelog
* Wed Oct 05 2011 Jakub Pavelek <jpavelek@live.com> 0.1.1
- adding desktop file

* Tue Sep 27 2011 Jakub Pavelek <jpavelek@live.com> 0.1
- first RPM packaging release

