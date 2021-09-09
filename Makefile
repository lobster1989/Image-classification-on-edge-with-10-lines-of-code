PROJECT   =   classification
OPENCV_FLAGS = $(shell pkg-config --cflags --libs-only-L opencv4)
#OPENCV_FLAGS = $(shell pkg-config --cflags --libs-only-L opencv)

.PHONY: all clean

all: $(PROJECT)

$(PROJECT) : *.cpp
	$(CXX) -std=c++17 -O2 -I. -o $@ $^ -lvitis_ai_library-classification -lvitis_ai_library-dpu_task -lvitis_ai_library-xnnpp -lvitis_ai_library-model_config -lvitis_ai_library-math -lvart-util -lxir -pthread -ljson-c -lglog ${OPENCV_FLAGS} -lopencv_core -lopencv_videoio -lopencv_imgproc -lopencv_imgcodecs -lopencv_highgui 

clean:
	$(RM) -rf *.o 
	$(RM) $(PROJECT)
