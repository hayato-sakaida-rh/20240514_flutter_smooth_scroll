init:
	cd ios; \
	pod repo update;
	make clean-ios

lint:
	dart fix --apply

clean-ios:
	cd ios && rm -f Podfile.lock
	fvm flutter clean
	fvm flutter pub get
	cd ios && pod install
