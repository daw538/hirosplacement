After three weeks of things not quite going to plan, it seems that good fortune has finally fallen upon us in the fourth week; which in turn allowed us to start undertaking proper data analysis.

Previously, at the end of week 3, we had collected some data directly from sunlight in order to extract a clear solar spectrum, with the aim of calculating the radial velocity shift visible from our location. Unfortunately, since our first set of data collection turned out to be noisy and often saturated, we were not able to see the absorption lines (e.g Sodium at ~589nm) clearly on the constructed spectrum. Hence, we made a second attempt to obtain data, which despite being on a cloudier day,  was much better than the first one. The absorption lines appeared much more clearly than in the spectrum from our first attempt. You can see pictures below for comparison.

<br/><br/>
<img src=https://github.com/daw538/hirosplacement/blob/master/Week_4/scatter1n.png width="430" height="252" >
<img src=https://github.com/daw538/hirosplacement/blob/master/Week_4/scatter1.png width="430" height="255">
<br/>
*1 Spectrum from first and second data sets.*
<br/>
*__Top Left__* : *First data set, sodium line is hidden behind the noise at ~589nm.*
<br/>
*__Top Right__*: *Second data set, sodium line at ~589nm is circled in red.*
<br/><br/>
We also made a combined plot showing the combination of multiple normalised spectra to see how do they differ with respect to time. We aim to use the mean spectrum to calculate the wavelength shift between our and the reference solar spectrum rest wavelengths.The difference of noisie level between first and second data set can be seen from the pictures below. The different colors on the plot determines the different observing times.
<br/><br/>
<img src=https://github.com/daw538/hirosplacement/blob/master/Week_4/combined30noisy.png width="430" height="254" >
<img src=https://github.com/daw538/hirosplacement/blob/master/Week_4/combined30.png width="430" height="254">
<br/>
*30 spectra are combined from first and second data sets.*
<br/>
*__Top Left__* : *First data set, higher noise level and shifts showing during the time.*
<br/>
*__Top Right__*: *Second data set, less noisy and more precise. Sodium absorbtion line is circled in red.*
<br/><br/>
How are we going to calculate the velocity?
Using a script, we create an observer (in our case the observer is us on the roof!) and by using the sun’s position at a certain time which we can then calculate the relative distance between them. Hence, the change of distance with respect to time will give us the velocity that we are looking for. We aim to progress this further during the upcoming weeks.

In the meantime, we also have good news regarding the broken laser! Our technical advisor had been away for the past week upgrading the BiSON telescope in California.  Upon his return, he was able to fix both the laser and also the the spectrum analyser that had not been working from the outset  of the summer placement! Now we should be able to use all of our equipment and successfully observe the potassium absorption line on the spectrum analyser. 


[:arrow_left:](https://github.com/daw538/hirosplacement/blob/master/week3.md)
[:house:](https://github.com/daw538/hirosplacement)
[:arrow_right:](https://github.com/daw538/hirosplacement/blob/master/week5.md)
