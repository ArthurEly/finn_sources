<project xmlns="com.autoesl.autopilot.project" name="finn_feeder_chiplet" top="finn_feeder_chiplet" projectType="C/C++">
    <includePaths/>
    <libraryPaths/>
    <Simulation argv="">
        <SimFlow name="csim" ldflags="" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="finn_feeder.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="finn_feeder_chiplet.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../../finn_feeder_test.cpp" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

