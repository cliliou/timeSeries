
Local setup: 

cd backend
npm install
docker-compose up -d
npx prisma generate
npx migrate dev
npm run start:dev

Use: 
go to http://localhost:3000/init
to init 10000 elements
go to http://localhost:3000/compositionQuery
to test the compositionQuery the cottonBio test.