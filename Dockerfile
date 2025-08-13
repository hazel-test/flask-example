FROM python:3

# set a directory for the app
WORKDIR /app

# copy all the files to the container 
# COPY . . 명령어는 source 프로젝트 외 github상에 있는 전체 내용을 복사하기 때문에 권장되는 설정은 아님(불필요한 정보 노출 -> 컨테이너를 탈취했을 때 git history 상에 남아있는 정보로 2차 공격 등에 활용가능성 등)
# -> 필요한 디렉토리에 한해 컨테이너로 복사될 수 있도록 조치 필요
COPY . .

RUN apt-get update 
RUN pip install --no-cache-dir -r requirements.txt

# port number
EXPOSE 80

# run command
CMD ["python", "source/app.py"]
