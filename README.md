# Choosing recovery

In May 2020, when I began the lengthy process of recovery from my
years-long eating disorder, I tried looking for a support app. What I found
wasn't very encouraging - a couple of apps supporting absolute 'cold-turkey'
sobriety from _anything_. I found them impersonal, competitive, and
impossible to use.
The cold-turkey approach works wonders for some, of course: but there's
still an absolute lack of substance-abuse-centric tech solutions keeping in
mind that recovery approaches rarely tend to be one-size-fits-all. The
potential impact is enormous: millions of people across the world continue to
struggle with substance abuse and its recovery.
There is, often, a common pattern to most struggles: for example, one
crucial pattern is the time of use. These "trigger times" tend to be highly
user-specific and vary widely depending on the user's daily habits. Consider
this small survey I conducted with the help of an international
eating-disorder support group:

Therefore, an ideal solution must keep in mind:<br>

Recovery is non linear, and 100% sobriety (though encouraged) may
not be possible. The solution must allow the chance of relapses, and
track relapses to identify patterns.
By extension, user goals may vary. User A may desire to track
complete abstinence from alcohol, for instance; User B may wish to
cut from 10 drinks a day to 5. The solution must support both.
While time of use varies highly from user-to-user, there are definite
patterns for each user. The solution must, therefore, be user-specific.

### The Design

My solution, therefore, is a *recovery app*, the design of which allows users
to set a goal of 'x' substance-use instances a day. The app supports
long-term tracking of use patterns and corresponding trigger events, if any.
With the help of machine learning, it predicts future substance use from the
previously recognised patterns. Further, the app notifies users of previously
successful distraction/overcoming strategies and uses positive reinforcement
to celebrate victories.

The design, thus, includes:

**A substance-use log**<br>
This is implemented as a calendar, allowing users to mark the number of substance-use instances (if any) 
they've had, on a day-to-day basis. Each use is logged as an event, storing thespecific times of use. It
supports weekly, biweekly, and monthly views (yearly views can be implemented), allowing users to see 
their progress over these time frames. Each user of the app has an associated database. Daily, the log feeds in:<br>
(a) the number of relapses, and  <br>
(b) the times of the relapses.<br>

**A journal**<br>
This allows users to describe their daily progress through text based entries.
In specific, the journal records 2 primary entries:  <br>
(a) a short [upto-10-word], hourly entry of this day's recovery process,
specifying triggering events if any, and<br>
(b) successful distraction strategies.<br>
The above are then fed into the user database. In addition, the journal
encourages users to describe daily victories, personal bests, and so on. A
possible implementation is through a text-field form, which stores data at
the backend.

**A harm reduction sidebar**<br>
The app accepts that 100% sobriety may be impossible. While abstinence
remains the ultimate goal, it recognizes that even harm reduction is a
success, and therefore makes relevant strategies readily available for users.
Users can also get in touch with related organisations and seek community
support.

**Substance-use pattern analysis and prediction**<br>
On having retrieved data logs:
(a) Text processing is performed on the daily journal entries:
The app performs sentiment analysis using Long Short Term Memory
residual neural networks (LSTM RNN) on hourly experience, triggers and
distraction strategies. The processed data is then made ready for retrieval.
An implementation (pseudocode) of sentiment analysis, using an LSTM RNN
network is given as follows:
1. Import necessary libraries.
2. Load in and read the journal entry hourly data.
3. Preprocess the text (remove punctuation, convert to uniform case,
split with newline delimiter, and store as dataframe with columns
time (hourly) and entry.
4. Encode words for embedding lookup: tokenizing the data creates a
vocabulary-to-integer mapping. Store the new lists of integers
indexed with times in a new dataframe.
5. Encode the entry labels. Possible labels are: 'positive', 'potentially
triggering', and 'triggering'.
6. Check the data for, and remove outliers (since journal entries are
limited to 10 words, this is task is more or less concerned with
removing 0-word entries).
7. Pad, or truncate, all journal entries to a fixed length:
a. Each row of the encoded dataframe entry column must be of
fixed length L,
b. Left-pad entries shorter than L with 0s,
c. Truncate entries longer than L.
8. Split the dataset into training, cross-validation, and test sets:
a. Create sets for features (index hours, entries) and labels
b. Define split fraction [data to be retained in training set.]
c. Divide remaining data between validation and test sets.
9. Create a generator function to batch the data into full batches.
10. Define the sentiment network:
a. Define the LSTM network architecture, using the following layer
after tokenizing:
i. An embedding layer that converts word tokens to
embeddings of specific size,
ii. An LSTM layer defined by the size of hidden states and
the number of layers
iii. A fully connected output layer mapping LSTM layer
outputs to desired output size,
iv. An activation layer that returns the final output.
b. Define the RNN model class and train on GPU.
c. Instantiate the network by defining the hyperparameters (size
of the vocabulary/ range of values for word tokens, size of
desired output, number of output classes, embedding size,
On the basis of labels, 'triggering' and 'potentially triggering' hours and their
trigger words are stored, distraction strategies are retrieved, and correlated
with the data fed in from the substance-use log.
(b) The data received from the substance-use log (number of use-instances
per day, and the focal hours at which they occur) is correlated with the
processed text data to identify patterns as follows:
- A daily breakdown of substance-use trigger times - at which hours
(with a suitable margin) is the user likely to use?
- A weekly breakdown of trigger times - on which days of the week is
sobriety harder? (this could, for example, depend on workdays and
weekends)
- On an extended data collection period, are there any specific days of
the year when the user is likely to use? (Family holidays, for example,
are potential relapse times for users.)
Learning from these patterns, the app notifies the user during potential
trigger/ trigger times and retrieves previously successful distraction
strategies. This could include links to external sites, or a contact, for
example. If successful, the app offers positive reinforcement; if not, the use
instance is logged.
