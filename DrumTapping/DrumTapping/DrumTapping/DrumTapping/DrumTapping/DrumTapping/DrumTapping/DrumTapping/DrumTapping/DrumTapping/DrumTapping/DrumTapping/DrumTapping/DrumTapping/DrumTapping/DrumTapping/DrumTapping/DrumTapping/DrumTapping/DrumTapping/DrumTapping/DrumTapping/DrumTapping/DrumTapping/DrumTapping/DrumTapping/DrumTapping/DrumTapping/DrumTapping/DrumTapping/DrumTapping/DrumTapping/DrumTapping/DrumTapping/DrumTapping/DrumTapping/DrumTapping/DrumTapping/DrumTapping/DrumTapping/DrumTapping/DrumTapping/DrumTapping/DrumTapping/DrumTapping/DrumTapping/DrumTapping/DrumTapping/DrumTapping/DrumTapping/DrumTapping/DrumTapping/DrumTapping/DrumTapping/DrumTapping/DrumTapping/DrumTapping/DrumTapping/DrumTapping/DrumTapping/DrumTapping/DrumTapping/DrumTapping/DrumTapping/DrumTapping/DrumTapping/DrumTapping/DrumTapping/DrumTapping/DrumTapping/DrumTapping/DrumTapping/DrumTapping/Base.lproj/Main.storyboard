<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="4514" systemVersion="13B42" targetRuntime="iOS.CocoaTouch.iPad" propertyAccessControl="none" useAutolayout="YES" initialViewController="BYZ-38-t0r">
    <dependencies>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="3747"/>
    </dependencies>
    <scenes>
        <!--View Controller-->
        <scene sceneID="tne-QT-ifu">
            <objects>
                <viewController id="BYZ-38-t0r" customClass="LJViewController" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="eCT-LN-KDQ"/>
                        <viewControllerLayoutGuide type="bottom" id="2nC-a9-KgL"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="8bC-Xf-vdC">
                        <rect key="frame" x="0.0" y="0.0" width="768" height="1024"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <button opaque="NO" contentMode="scaleToFill" fixedFrame="YES" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="6DP-Nf-kQB">
                                <rect key="frame" x="313" y="858" width="143" height="51"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <accessibility key="accessibilityConfiguration">
                                    <accessibilityTraits key="traits" none="YES" button="YES" staticText="YES"/>
                                </accessibility>
                                <fontDescription key="fontDescription" type="system" pointSize="55"/>
                                <state key="normal" title="Next">
                                    <color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
                                </state>
                                <connections>
                                    <action selector="nextButtonClicked:" destination="BYZ-38-t0r" eventType="touchDown" id="Ri6-4f-atY"/>
                                    <segue destination="juH-nM-xg7" kind="modal" id="u42-BZ-UI9"/>
                                </connections>
                            </button>
                            <label opaque="NO" clipsSubviews="YES" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="Please tap the drum after you hear each beep immediately. And only tap once for every cowbell sound.    " lineBreakMode="wordWrap" numberOfLines="0" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" preferredMaxLayoutWidth="596" translatesAutoresizingMaskIntoConstraints="NO" id="3OX-K2-gYt">
                                <rect key="frame" x="106" y="292" width="596" height="116"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="25"/>
                                <color key="textColor" cocoaTouchSystemColor="darkTextColor"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <label opaque="NO" clipsSubviews="YES" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="When you are ready, please click below Next to begin." lineBreakMode="wordWrap" numberOfLines="0" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" preferredMaxLayoutWidth="596" translatesAutoresizingMaskIntoConstraints="NO" id="IPC-GW-t4y">
                                <rect key="frame" x="106" y="388" width="596" height="116"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="25"/>
                                <color key="textColor" cocoaTouchSystemColor="darkTextColor"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <label opaque="NO" clipsSubviews="YES" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="Drum Tapping Experiment" textAlignment="center" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="cnh-B2-UFO">
                                <rect key="frame" x="106" y="104" width="468" height="64"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="40"/>
                                <color key="textColor" red="1" green="0.0" blue="0.0" alpha="1" colorSpace="calibratedRGB"/>
                                <nil key="highlightedColor"/>
                            </label>
                        </subviews>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="calibratedWhite"/>
                    </view>
                    <connections>
                        <outlet property="nextButton" destination="6DP-Nf-kQB" id="qPp-P5-LGT"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="dkx-z0-nzr" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="62" y="4"/>
        </scene>
        <!--Tapping View Controller-->
        <scene sceneID="6Ok-SL-AgB">
            <objects>
                <viewController id="juH-nM-xg7" customClass="TappingViewController" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="AUh-n6-jLc"/>
                        <viewControllerLayoutGuide type="bottom" id="tqd-zf-EXK"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="L7o-iR-6s6" customClass="TappingView">
                        <rect key="frame" x="0.0" y="0.0" width="768" height="1024"/>
                        <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                        <subviews>
                            <button opaque="NO" contentMode="scaleToFill" fixedFrame="YES" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="zoe-9Y-LOD">
                                <rect key="frame" x="307" y="846" width="154" height="64"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="55"/>
                                <state key="normal" title="Start">
                                    <color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
                                </state>
                                <connections>
                                    <action selector="startButtonClicked:" destination="juH-nM-xg7" eventType="touchDown" id="rfe-AK-r1l"/>
                                </connections>
                            </button>
                        </subviews>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="calibratedWhite"/>
                    </view>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="jpA-t3-1pJ" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="975" y="4"/>
        </scene>
    </scenes>
    <simulatedMetricsContainer key="defaultSimulatedMetrics">
        <simulatedStatusBarMetrics key="statusBar" statusBarStyle="blackOpaque"/>
        <simulatedOrientationMetrics key="orientation"/>
        <simulatedScreenMetrics key="destination"/>
    </simulatedMetricsContainer>
</document>