### Week 1

We started the first week by completing a ‘project initiation document’.  This helped us to set out the goals of our project, and encouraged us to start thinking about a timeline. We decided that the first week would be dedicated to learning about how to use the laser in our laboratory.

The laser is a Toptica DL Pro, which is a tunable semiconductor diode laser. This means that the wavelength can be changed slightly, within a limited range. The wavelength can be controlled by changing the temperature, driving current, and position of the diffraction grating on the output. However, changing one of these variables can change some or all of the others, so the operation is not straightforward! In order to learn about the operation of the laser, we were planning to observe its wavelength using an optical spectrum analyser. However, at our first attempt to turn it on, we found a screen full of error messages! While waiting to see if it would be possible to work around the problem, we began looking for alternative equipment in the department.
<br>
<a href="url"><img src="https://github.com/daw538/hirosplacement/blob/master/Week%201/OSA.jpg?raw=true" align="left" height="180" ></a>
<a href="url"><img src="https://github.com/daw538/hirosplacement/blob/master/Week%201/OSA_Errors2.jpg?raw=true" align="middle" height="180" ></a>

Eventually, we obtained a CCDSPEC, usually used in the year 1 laboratory for observing the solar spectrum. After obtaining the software required to capture images from the ATIK CCD and process them to obtain a spectrum, we tested the device using a sodium vapour lamp. The spectrum we produced matched what we expected for the lamp, indicating that everything was working as expected. In order to use the CCDSPEC to make meaningful measurements, it would be necessary to calibrate it, using the known spectrum of the lamp. However, we were not sure if the wavelength range of the spectrometer would be sufficient to allow us to view the spectrum of the laser. This was, therefore, the next thing we tested.
<br>
<a href="url"><img src="https://github.com/daw538/hirosplacement/blob/master/Week%201/CCDSPEC.jpg?raw=true" align="left" height="180" ></a>
<a href="url"><img src="https://github.com/daw538/hirosplacement/blob/master/Week%201/NaLampTest2.jpg?raw=true" align="middle" height="180" ></a>
<br>

<a href="url"><img src="https://github.com/daw538/hirosplacement/blob/master/Week%201/NaLampSpec.jpg?raw=true" align="left" height="180" ></a>
<!--crop images, move text-->
<BR CLEAR="left">
We found that the single line of the laser light was visible in the spectrometer output, but it was not clear whether the resolution of the device would be sufficient to allow the small changes in wavelength caused by tuning the laser to be observed. To test this, we rotated the output diffraction grating through its full range, giving the largest wavelength change we would expect to use. There was a small difference in the spectra obtained, but the change was certainly not clear enough to make the setup a suitable substitute for the broken spectrum analyser.
<br>
<a href="url"><img src="https://github.com/daw538/hirosplacement/blob/master/Week%201/0V peak2.jpg?raw=true" align="left" height="200" ></a>
<a href="url"><img src="https://github.com/daw538/hirosplacement/blob/master/Week%201/140V peak2.jpg?raw=true" align="middle" height="200" ></a>
<!--crop images-->
**left:0V; right:140V**

Without being able to observe changes in the laser output, learning how the laser works became much more challenging! We spent a morning reading up on the relevant theory to get more familiar with the operation and, in the afternoon, met with our supervisors to come up with a plan for the rest of the project. We decided that we should investigate options for mounting the strong magnets required for Zeeman splitting around the new cell. We started to experiment with some already mounted magnets, to determine the magnetic field strength we could obtain with the separation increased to accommodate the larger cell.

In order to be able to see the Zeeman splitting of the line spectra, it was necessary to calculate the minimum required magnetic field (under ideal conditions), which provided an estimate of ~150mT. Checking that the rig we had planned to build would meet this requirement was a more difficult task, as understanding how magnetic fields interact is not a simple task. To solve this we used a program called FEMM (Finite Element Method Magnetics) to simulate the magnetic fields that the potassium cell would sit in. FEMM can model a range of related problems from magnetic fields to current and heat flow in 2D or radially symmetric environments, which was sufficient for our needs. Our model predicted a field ranging from ~140-180mT longitudinally along the cell – we will need to wait until it is constructed to see how accurate these predictions were!
<br>
<a href="url"><img src="https://github.com/daw538/hirosplacement/blob/master/Week%201/MagnetMock.jpg?raw=true" align="left" height="180" ></a>
<a href="url"><img src="https://github.com/daw538/hirosplacement/blob/master/Week%201/Field Test.jpg?raw=true" align="middle" height="180" ></a>
<a href="url"><img src="https://github.com/daw538/hirosplacement/blob/master/Week%201/BiSONCell.jpg?raw=true" align="middle" height="180" ></a>
<a href="url"><img src="https://github.com/daw538/hirosplacement/blob/master/Week%201/model_old.jpg?raw=true" align="middle" width="180" ></a>
