#### development

FROM node:14.17.3-buster AS build

WORKDIR /dev

COPY ./package.json package.json
COPY ./package-lock.json package-lock.json

RUN npm install

COPY . .

CMD [ "npm", "run", "start" ]


##### production/deployment

FROM build

WORKDIR /prod

COPY --from=build /dev /prod

COPY . .

RUN npm run build

