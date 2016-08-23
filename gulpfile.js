var gulp = require("gulp"),
    nodemon = require("gulp-nodemon"),
    gulpMocha = require("gulp-mocha"),  
    gutil = require('gulp-util'),
    run = require("gulp-run"),
    coffee = require('gulp-coffee'),
    env = require("gulp-env");
require('coffee-script/register');
    
gulp.task('default', function() {
    env({vars: {ENV: 'Dev'}});
    nodemon({
         script: 'app.js',
         ext: 'js',
         env: {
             PORT: 8000
         },
         ignore: ['./node_modules/**']
    })
    .on('restart', function(){
         console.log('Restarting');
    });
});

gulp.task('test', function() {
    env({vars: {ENV: 'Test'}});
    gulp.src('test/**/*.coffee', {read: false})
        .pipe(coffee({bare: true}).on('error', gutil.log))
        .pipe(gulpMocha({reporter: 'nyan'}));
});

gulp.task('test-watch', function() {
    gulp.watch(['./**/*.js', 'test/**/*.coffee'], ['test'])
    .on('error', gutil.log);
});

gulp.task('test-istanbul', function() {
    return run('istanbul cover _mocha --include-all-sources').exec();
});

gulp.task('lint', function() {
    return run('eslint .').exec();
});

