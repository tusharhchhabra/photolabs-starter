import React, { useEffect, useState } from 'react';

import './App.scss';
import HomeRoute from 'routes/HomeRoute';
import PhotoDetailsModal from 'routes/PhotoDetailsModal';
import useApplicationData from '../src/hooks/useApplicationData';

// Note: Rendering a single component to build components in isolation
const App = () => {
  const {
    photoData,
    topicData,
    selectedPhoto,
    showPhotoDetails,
    removePhotoDetails,
    favoritePhotos,
    setPhotosByTopics,
    toggleFavorite
  } = useApplicationData();

  return (
    <div className="App">
      <HomeRoute
        topics={topicData}
        photos={photoData}
        showPhotoDetails={showPhotoDetails}
        setPhotosByTopics={setPhotosByTopics}
        favoritePhotos={favoritePhotos}
        toggleFavorite={toggleFavorite}
      />
      {selectedPhoto &&
        <PhotoDetailsModal
          photo={selectedPhoto}
          removeModal={removePhotoDetails}
          showPhotoDetails={showPhotoDetails}
          favoritePhotos={favoritePhotos}
          toggleFavorite={toggleFavorite}
        />}
    </div>
  );
};

export default App;
