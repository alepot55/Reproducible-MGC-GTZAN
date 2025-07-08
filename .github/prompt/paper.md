**Nota:** Questa è una trascrizione del testo del paper. Per la visualizzazione delle figure, dei grafici e della formattazione esatta, si prega di fare riferimento al file PDF originale.

### **Patil et al. Journal of Big Data (2023) 10:108**
https://doi.org/10.1186/s40537-023-00789-2

---

## **RESEARCH**
### **Novel mathematical model for the classification of music and rhythmic genre using deep neural network**
Swati A. Patil¹,²*, G. Pradeepini¹ and Thirupathi Rao Komati³

\*Correspondence: swati.patil251@gmail.com
¹ Department of Computer Science and Engineering, Koneru Lakshmaiah Education Foundation, Guntur, A.P. 522502, India
² G. H. Raisoni Institute of Engineering and Business Management, Jalgaon 425001, India
³ GST GITAM Deemed to be University, Visakhapatnam, Andhra Pradesh 530045, India

---

### **Abstract**
Music Genre Classification (MGC) is a crucial undertaking that categorizes Music Genre (MG) based on auditory information. MGC is commonly employed in the retrieval of music information. The three main stages of the proposed system are data readiness, feature mining, and categorization. To categorize MG, a new neural network was deployed. The proposed system uses features from spectrographs derived from short clips of songs as inputs to a projected scheme building to categorize songs into an appropriate MG. Extensive experiment on the GTZAN dataset, Indian Music Genre(IMG) dataset, Hindustan Music Rhythm (HMR) and Tabala Dataset show that the proposed strategy is more effective than existing methods. Indian rhythms were used to test the proposed system design. The proposed system design was compared with other existing algorithms based on time and space complexity.

**Keywords:** Mathematical model, Neural network, Feature extraction, MG, Time complexity, Space complexity, Deep neural network Learning, GTZAN

---

### **Introduction**
Currently, huge amounts of data are being produced on many community media platforms. Because the amount of data is so large in terms of bytes, it is critical to categorize it so that users can simply search for and promote it. Our work is mostly concerned with the song data. Music-like audio can be processed or evaluated as a song melody using instruments only, only acoustic songs without electric instruments, or songs with both music and instruments. Audio or musical gestures must be converted to a binary format before being processed on a computer. Audio data is an analog signal, which is converted to a digital format by an analog-to-digital converter. The spectrogram and waves depict the audio signals.

Currently, music or tunes are broadly scattered on the Internet, and the measures of transferring or discharging music/melodies are simply expanding and not halting or reducing. Effective association and processing of such huge amounts of information, just as effective ordering, looking, and recovery of such enormous measures of musical data is a major challenge. Most music arrangement techniques are based on music classified by classification, state of mind, or various semantic tags [1]. The music Genre is a significant angle used to classify music/melodies in music shops, broadcasting, and searching. Automatic music sort characterization is a crucial part of music data recovery systems [2]. For humankind, it is not hard to order music in various types, however, comprehending it using PCs is a major test. There is a distinctive view that characterizes instruments, songs, beats, and moods to separate musical genres [3].

Music Genre grouping is generally significant in the music database of the executive's framework to look through music according to class. The kind order is a profoundly free type of naming [4]. Because of the specialized turn of events and innovations of savvy compact gadgets such as cell phones, pod music has reached everyone [5]. We as often as possible run over individuals with earphones or ear plugs in transit while strolling, driving even while examining, while at the same time doing activity or yoga. As the Internet is accessible, music has been effectively and promptly opened to individuals. When we listen to melodies, we never need to listen to the full playlist. Commonly, we need to listen to melodies that suit our temperament. Therefore, in this situation, it is significant or advantageous to have a rundown of melodies according to temperament or sort. Si that the client can pursue the music from the immense database without much of a stretch.

Liu et al. [6] have worked in the categorization of MG based on visual representation and have been effectively studied in recent years. Convolutional neural networks (CNN) have recently gained popularity as a means to accomplish tasks. The proposed CNN architecture uses multi-scale time-frequency information, transferring more appropriate semantic elements to the decision-making layer to distinguish the genre of an unfamiliar music trunk. The trials are assessed using the Ballroom, GTZAN and Extended Ballroom benchmark datasets. The proposed approach can obtain 93.9 percent, 96.7 percent, and 97.2%, respectively, according to the testing findings [7, 8].

The linking of genre-related labels to digital music files has been studied by [9] in MGC. It can be used to organize both commercial and private melody collections. Music tracks are frequently characterized as a collection of sound textures stimulated by timbres. To depict a complete track, the selection of sound textures is frequently used. They assessed the influence of texture selection on automatic MGC and provided a unique texture selector based on K-Means, which identifies a variety of sound textures inside each recording [10, 11].

Music is an essential and inseparable aspect of most people's lives. Several MG exist, each of which is distinct from the others, resulting in a wide range of musical preferences. Consequently, classifying music and recommending new music in music listening apps and platforms is an essential and timely subject. One of the most effective approaches to solving this challenge is to categorize music by genre. Several methods are available for categorizing and recommending music [12].

According to [13], music genre categorization is one of the sub-disciplines of music information retrieval (MIR) that is gaining in favor among academics, owing to the open problems. Despite the fact that research has produced a large number of publications, the issue still has a fundamental flaw: the music type is not clearly defined. Music classifications are hazy and ambiguous, owing to human subjectivity and disagreement [14].

Using a transfer learning technique [15], proposed an audio-based categorization strategy for 11 western MGs, including rock, pop, rape, country, metal, jazz, blue, R&B, folk music, Electronic Music, and Classical Music. One can achieve 0.9799 ROC-AUC and 0.8938 PR-AUC on a private 1100 songs collection. Using a deep learning model [16], created an autonomous music genre categorization. CNN is used for local feature extraction, whereas Long Short-Term Memory (LSTM) sequence-to-sequence autoencoders are used to learn representations of time series data while accounting for their temporal dynamics. Using the GTZAN dataset, computational experiments yielded an overall test accuracy of 95.4 percent and precision of 91.87 percent.

Labeling a music recording according to its genre is a natural and familiar method to characterize its content, according to [17] MG are useful for organizing music, creating individualized listening experiences, and creating playlists. Due to the inherent ambiguity and subjectivity, the automatic identification of an MG is a difficult task. Most music genre categorization efforts assume total label independence. Furthermore, the local classifier per node technique, which would be the best fit in this case, is time- and memory-intensive [18].

MGC is a vital and useful aspect of music information retrieval. Deep learning is increasingly used to classify MG for two reasons [19]. The starters eliminate the need for manual audio signal feature selection. Second, the hierarchical architecture is compatible with the temporal- and frequency-domain layering structure of music. The Transformer classifier performs better in MGC [20, 21] by analyzing the connection between distinct audio frames.

Jaime Ramirez [22] developed a web program that obtains tunes from YouTube and categorizes these tunes into MG. The technique described in this paper is built on models developed on audio sets' musical collection data. The conception output displays this sequential data in real time, in rhythm with the harmony video played the same time, with cataloguing outcomes displayed in the weighted area graph, where scores for the top-10 labels acquired for each block are given.

Automatic MGC is believed to be a basic component for obtaining music information, according to [22]. Indeed, music genre labels are extremely useful for categorizing albums, songs, and performers into groups with comparable features. To improve the recovery of MG, an accurate and effective MGC system is necessary. This research uses two key processes: feature extraction and classification, to present a novel music genre categorization model. Features such as “non-negative matrix factorization (NMF) features, Short-Time Fourier Transform (STFT) features, and pitch features were extracted during the feature extraction phase. Goulart et al. [23] proposed features extraction based on entropy fractal features and SVM classifier to classify blues, classical, and lounge genre achieved almost 100% accuracy.

Researchers Lima et al. [24] have proposed using genre labels to organize music, albums, and performers into groupings with common similarities. They describe a unique method for automatically determining the musical genre in Brazil based solely on the words of the songs. This type of categorization remains difficult in the difficulty.

To examine the influence of facet choice on the correctness of music genre categorization, Moses [25] utilized a Support Vector Machine with a radial basis function kernel as a classifier. In various feature combinations (FC), some traits are merged and matched (FC1, FC2, FC3, and FC4). The classification results demonstrated that the accuracy of each feature combination (FC) varied significantly, with the highest accuracy being 80 percent and the lowest being 67 percent. When the combination of the FC1 and FC2 features produces the same accuracy of 80%, the FC2 combination is preferred because the processing time is logically lower with fewer characteristics. For categorization, it is necessary to gather a large number of songs and index them according to their genre. The skip grammar model then locates comparable context songs for suggestions. Consequently, the proposed system functions as a complete music recommendation system that provides excellent user experience [26].

Lima et al. [27] Genre labels may be used to categorize songs, albums, and performers together based on their shared characteristics. In NLP, this type of categorization remains difficult. The F1-score parameter provides an average result of 0.48, and the BLSTM technique surpasses the other models in the studies. Gospel, funk-carioca, and sertanejo, which had F1 scores of 0.89, 0.70, and 0.69, respectively, may be classified as the most unique and easiest to categorize in the musical genres of Brazilian music settings [28].

They employed textual material given as lyrics of the accompanying song because genre dependence is not confined to the audio profile. To include acoustic information in spectrograms, they used a CNN-based feature extractor for spectrograms and Hierarchical Attention Network-based feature extractor for lyrics [29–31]. In several papers [32, 33], the active transfer MGC technique (ATMGCM) was proposed for musical genre categorization.

To create mathematical models for music genre categorization, [34] employed a machine learning technique created on a hybridizing genetic programming and neural networks. They created three multi-label classifiers with varied complexity and accuracy trade-offs that can detect the degree to which audio content belongs to 10 distinct MG.

According to [35], one of the goals of the music information retrieval (MIR) community is to study novel approaches and build innovative systems that can competently and successfully extract and propose songs from massive records of music content. They also show how our database can help with specific MIR tasks, and compare it to other databases available in the literature to help the MIR community.

According to the literature, genre classification requires extra attention to increase its performance metrics. The classification was based on data from the spectrograms of songs. The proposed approach will be incredibly useful in a number of industries, such as films and education. Numerous online music-playing services, such as Ganna.com, use MGC to improve user suggestions. Most of the research work is based on feature extraction techniques and then applying machine learning algorithms to classify the music or genres. In this work, because music is very dynamic in nature, manual extraction of features from music clips or by onset pattern detection or the music pattern at periodic time intervals does not provide accurate results. Therefore, a deep neural network is used for the automatic detection of features that train as per the given musical pattern. Guido [36, 37] proposed a mass of discrete time signal based on Teager energy operator enables more precise and detailed analysis of audio signal. This author [36, 37] also proposed a model based on entropy and deep neural network to fuse the important features information. Scalvenzi et al. [38] proposed a method using discrete wavelet packet transform with support vector machine (SVM) to gain the accuracy near to 90% for sorting semantic information.

The remainder of this paper is organized as follows. "Proposed system architecture and mathematical model" section delves deeper into the mathematical model of the planned system. The recommended technique has been applied to a variety of musical styles and yielded positive results. The proposed system design is compared to a number of algorithms, and the results are reported in the Results and Discussion section. The proposed scheme is evaluated on multiple workstations to find out the time complexity of the proposed scheme, according to [39]. "Conclusion" section is conclusion part.

---

### **Proposed system architecture and mathematical model**

Figure 1 is the suggested system architecture. There are three components to the recommended architectural technique: compress, decompress, and filter CNN. Appropriate padding, with the purpose of both leveraging input features and decreasing resolution by using an appropriate stride at the end of each step run with convolutions. Fine-grained features forwarding provides the ideal estimate optimal fixed-lag. Optimal smoother provides the optimal estimate of x^_t for a given fixed-lag N.

The main contributions of this research are as follows:

1.  Extracting features using a Pre-trained Deep Neural Network (DNN) to evaluate the proposed method using precision, recall, F1-Score, and accuracy, and evaluating the system on selected datasets.
2.  The parallel Convolution Deconvolution neural network model to extract finest level of features.
3.  Removes the gradient descent problem using PreLU.

**Steps in Proposed System Architecture:**

The network architecture is decided on trial-and-error basis. The N no. of trials are carried out to observe the statical output. The hyperparameters: Number of input layer=1, layer 1=512, layer 2=256, layer3=128, layer4=64 neurons, number of output layer=1 and optimizer = adam.

1.  In the first stage, convolution and deconvolution are performed. In deconvolution more features that are not important in convolution are extracted along with the features in the convolution. This mixture of the important and unimportant features is then fed to the convolution with filters and convolution with an element-wise sum. The proposed framework is illustrated in Fig. 1.
2.  The reduction, decompression, and filtered CNN were the best methods.
3.  All convolutions were performed with the required padding and, at the end of each step, a good stride to maximize the input features and reduce the resolution.
4.  After additional convolution and pooling, the feature mapping decreased. Deconvolution is performed using the proposed methodology to obtain the original image, as shown in Fig. 1.
5.  Deconvolution is the up-sampling of images. It generates high-resolution images and maps low-dimensional images to high-dimensional ones. A Parametric Rectified Linear Unit (PReLU) activation function is used in the convolution. PRELU handles negative inputs that the sigmoid activation function cannot handle. PReLU is a non linear activation function used as an activation function to make more differences among classes so that it improves the performance result.
6.  The vanishing gradient problem was eliminated using PReLU.

The impulse response is obtained by multiplying the gaussian function with the sinusoidal wave. Due to multiplication-convolution condition, convolution of the Fourier Transform of the harmonic function and the FT of the Gaussian function (Convolution theorem) is the result of the Fourier transform (FT) of a filter's impulse response. In the filter, an actual and an unreal component denote orthogonal orientations. The two pieces can be used together or independently to create a complicated number.

*x(m, n; λ, θ, ψ, σ, γ) = exp( -(m'² + γ²n'²) / 2σ² ) * exp( i * (2π * m'/λ + ψ) )*  **(1)**

*x(m, n; λ, θ, ψ, σ, γ) = exp( -(m'² + γ²n'²) / 2σ² ) * cos( 2π * m'/λ + ψ )*  **(2)**

*x(m, n; λ, θ, ψ, σ, γ) = exp( -(m'² + γ²n'²) / 2σ² ) * sin( 2π * m'/λ + ψ )*  **(3)**

where Eq. 2.1, 2.2 and 2.3 is complex, real and imaginary respectively.

*m' = mcosθ + nsinθ and n' = -msinθ + ncosθ*  **(4)**

The wavelength of the sinusoidal component is represented by λ and the orientation of the normal to the parallel bands of a function is represented by θ in this equation. Here, σ is the sigma/standard deviation of the Gaussian envelope, ψ is the phase offset, and γ is the spatial aspect ratio, and specifies the ellipticity of the support of the function.

[...Complex Kalman Filter equations from (5) to (20) are omitted for brevity but are present in the PDF...]

A feedback pass is also used, which analyses data reserved from the filter forward pass. The backward pass equations entail recursive data computations that are used to determine the smoothed state and covariance at each observation period.

[...]

In the right-side part of the network's convolutional stages, we used stacking method where output of a layer is added to deep layer. The extracted features were then sent from the initial stages to final stage scanning from the left side of the system to the right segment through horizontal linkages, as shown in Fig. 1. So, we able to improve the precision of the final silhouette prediction by finding very fine data that would have been lost during the compression stage. The merging time of model has improved as a effect of these relations.

---

### **Data preparation**
For implementation the proposed method is applied on two datasets. GTZAN, Hindustani Music Rhythm (HMR), and Indian Music Genre (IMG) datasets. GTZAN has 10 genres viz blues, classical, country, disco, hip-hop, jazz, metal, pop, reggae, rock have 1000 songs. HMR has 3 genres of Hindustani Music Rhythm dataset have taals: Ektaal, Zaptaal, Rupak, Teentaal have 300 songs and IMG dataset has 5 genres Sufi, bollypop, classical, Ghazals and Carnatic music have 500 songs. For feature extraction Librosa library is used. Keras, numpy, pandas library of python is used to implement proposed method. Training and testing data is selected in 80:20 ratio that is 80 as training and 20 as testing. For tonality perception using one of percussion instruments Tabala is used here as a dataset. This dataset contains total 561 files played on Tabala with Addhatritaal, bhajani, deepchandi, dadra, rupak, zaptaal, ektaal, and tritaal with 78,72,60, 72, 60, 60, 60,99 clips. The time signature of all the taal in suggested method have different number of beats. Like Teentaal have 16 beats, Rupak have 7 beats, Ektaal 12 beats, Zaptaal have 10 beats.

---

### **Results and discussion**
Planned approach is verified on 390 songs from very well-known dataset GTZAN, one from every category. Figure 2 shows typical confusion matrix diagonal clearly contains dominating values, as shown by the confusion matrix. The confusion matrix also illustrates that the suggested design reduces the chances of misdiagnosis. The performance characteristics have been determined using the confusion matrix. Accuracy, recall, and F1-score were calculated using standard mathematical techniques and presented in Table 1. We can simply state that the recommended construction for the sorting of songs genre is dependable since the accuracy of the categorization of music genre ranges from 99 percent to 99.85 percent. Furthermore, the minimal accuracy, recall, and F1-score values are 94 percent, 93 percent, and 96 percent, respectively. The maximum accuracy, recall and F1-score values are 100 percent, 99 percent, and 99 percent, respectively. Figure 3 depicts the performance of suggested architecture with other algorithms.

The suggested design is compared to some current architecture using the same dataset. The accuracy of song genre categorization is evaluated using VGG16, Alexnet, and Recurrent Neural Network (RNN), as well as a proposed architecture, as shown in Table 2 and Fig. 4.

On the Indian classical taal (rhythm), the planned method is also verified. In Indian classical music, the tabla and dholak are the two main drumming instruments. The tabla is a duo of drums of various woods and sizes that are played together by tapping with the hands to produce a rhythmic sound. The sounds are then arranged in a variety of rhythm patterns to match musical performances. The suggested system architecture is also verified on the Indian classical taal dataset suggested by [40]. The rhythm patterns are evaluated on the basis of Taal: Ektaal, Rupak, Teentaal, and Zaptaal.

In Fig. 5 the performance parameters are shown graphically. All of the characteristics considered for the classification using the suggested proposed method are higher, according to the graph of performance parameters. The accuracy of rhythm classification is at least 92 percent for each class. Rhythmic similarity is tested by using various architecture like Alexnet, 16-layer deep neural network for CNN: VGG 16, and Recurrent Neural Network with suggested architecture which is shown in Table 3. For the classification of taals as compared to other machine learning algorithm mentioned in, proposed architecture gives best performance. Work done by [41], the proposed BP-Model and SP-Model gave less accuracy as compared to proposed method in this paper for HMR dataset.

The suggested architecture gives far better result as compared to other similar work as shown in below Table 4.

Table 5 compares the proposed System Architecture (PSA) classification with those of other algorithms. This study evaluated the proposed system for the IMG dataset along with the existing neural network architectures, VGG16, AlexNet, and RNN. Table 6 shows performance measure on IMG and HMR dataset and Tabala Dataset. HMR dataset has song and music data with 4 taals: Ektaal, Rupak, zaptaal and Teentaal (Tritaal). We have also used Tabala dataset which is exclusively rhythmic dataset with taal on percussion instrument Tabala. As shown in Table 6 we can see that the accuracy and overall performance of Tabala dataset if far better than HMR dataset with the same taal. The deficiency in result is due to same Bol (lyrics) of taal at some places is same for these 4 taalas. The proposed system architecture takes 372 Mb memory for the process of classification. The memory required for the classification is approximately 4 times less than that of the RNN classifier.

The time complexity was tested for numerous CPUs. Typical response times for various hardware systems are shown in Fig. 6. This computational time is much less than time required for music category. Figure 7 shows that the proposed architecture uses 372 MB of memory in the system architecture. Compared with the RNN classifier, this classification requires approximately four times less memory. Figure 8 shows the learning curve of training Vs validation curve.

---

### **Conclusion**
This research classifies MG using spectrograph feature values from temporal clips of selected music, as well as audio sample not known. The proposed system architecture is evaluated using two datasets: the Indian rhythms and GTZAN. The GTZAN dataset contains genres for western music, which differs significantly from Indian music. We're also focusing on rhythms in this study. As a result, we employed a rhythmic dataset with a unique pattern to recognize the various and dynamic nature of music. The GTZAN dataset has a classification accuracy of 99.41 percent, while 16-layer CNN, Alexnet, and Recurrent Neural Network have accuracy of 90.93 percent, 94.55 percent, and 91.58 percent, respectively. The suggested system architectural category has an average F1 score of 96.9%, which is significantly higher than current architectures. When evaluated on Indian rhythm, the proposed system design achieves a precision of 93.44 percent, which is higher than earlier architectures. The system's time complexity is quite low. When memory requirements for processing are taken into account, the suggested system architecture outperforms competing categorization techniques. According to the findings, the suggested method gave significant performance as compared to alternative algorithms on the selected GTZAN and Indian rhythms dataset.

---

### **Tables**

**Table 1: Performance parameters of proposed algorithm on GTZAN dataset**
| | Accuracy | Precision (%) | Recall (%) | F1-score (%) |
| :--- | :--- | :--- | :--- | :--- |
| **Proposed system** | 99.41% | 96.90 | 97.10 | 97.10 |
| **BiLSTM [43]** | 97.80% | 88 | 94 | 78 |
| **4 Layers-2D CNN with Data Augmentation [44]** | 81.55 | 83.50 | 89.01 | 86.17 |
| **RCNN with Data Augmentation [44]** | 69.49 | 97.94 | 88.04 | 92.7 |

**Table 2: Accuracy of music genre categorization in the GTZAN dataset using various topologies**
| | Proposed architecture | VGG16 | Alexnet | RNN |
| :--- | :--- | :--- | :--- | :--- |
| **Ours** | 99.41 | 90.93 | 94.55 | 91.58 |
| **Yang et al. [45]** | 92.5 | 88.7 | 88.8 | 92.5 |

**Table 3: Classification accuracy of Indian beats using various designs**
| | Proposed architecture | SVM | Naïve Bayes | Decision tree | KNN |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Accuracy** | 93.44% | 48.38% | 48.38% | 51.61% | 38.70% |
| *(Ref: Hettiarachchi et al. [46])* | | | | | |

**Table 4: The result compared with other similar method**
| Method | Accuracy (%) |
| :--- | :--- |
| Proposed method | 93.44 |
| Proposed method [41] | 63 |
| Data mining method [46] | 44.51 |
| Dynamic frame analysis and SVM [49] | 98 |
| Entropy and GMM [47] | 69.65 |

**Table 5: Comparison of the PSA with existing algorithms based on accuracy on the IMG dataset**
| IMG dataset genre | PSA (%) | VGG16 (%) | Alexnet (%) | RNN (%) |
| :--- | :--- | :--- | :--- | :--- |
| Bollypop | 98.73 | 97.92 | 95.23 | 87.49 |
| Carnatic | 99.16 | 97.16 | 91.24 | 89.30 |
| Ghazal | 98.41 | 97.20 | 92.21 | 92.61 |
| Semiclassical | 99.20 | 98.64 | 89.32 | 84.98 |
| Sufi | 99.16 | 98.28 | 94.31 | 82.34 |

---

### **Acknowledgements, Declarations & References**
[Le sezioni Acknowledgements, Author contributions, Funding, Availability of data and materials, Declarations, Competing interests, e la lista completa delle Referenze (1-50) sono omesse in questa trascrizione per brevità ma sono presenti nel PDF originale.]