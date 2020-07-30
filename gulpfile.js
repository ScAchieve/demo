var gulp = require('gulp');
var sass = require('gulp-sass');
var minifyCss = require('gulp-minify-css');
var inject = require('gulp-inject');
var babel = require('gulp-babel');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');
var cleanCSS = require('gulp-clean-css');
var del = require('del');

var browserSyncInject = require('gulp-browsersync-inject');
var connect = require('gulp-connect');
var open = require('open');

var directory = "sc";

var paths = {
  styles: {
    // src: 'src/styles/**/*.sass',
    src: './' + directory + '/dist/css/**/*.css',
    dest: './' + directory + '/assets/styles/'
  },
  scripts: {
    src: './' + directory + '/src/scripts/**/*.js',
    dest: './' + directory + '/assets/scripts/'
  },
  sass: {
    src: './' + directory + '/src/styles/**/*.scss|*.sass',
    dest: './' + directory + '/assets/styles/'
  },
  index: './**/index.html'
};
/* Not all tasks need to use streams, a gulpfile is just another node program
 * and you can use all packages available on npm, but it must return either a
 * Promise, a Stream or take a callback and call it
 */
function clean() {
  // You can use multiple globbing patterns as you would with `gulp.src`,
  // for example if you are using del 2.0 or above, return its promise
  return del([ 'assets' ]);
}

/*
 * Define our tasks using plain functions
 */
function styles() {
  return gulp.src(paths.styles.src)
    .pipe(minifyCss())
    .pipe(gulp.dest('./' + directory + '/assets/styles/css'))
    .pipe(cleanCSS())
    // pass in options to the stream
    .pipe(rename({
      basename: 'main',
      suffix: '.min'
    }))
    .pipe(gulp.dest(paths.styles.dest))
    .pipe(connect.reload());
}

function scripts() {
  return gulp.src(paths.scripts.src, { sourcemaps: true })
    .pipe(babel())
    .pipe(uglify())
    .pipe(concat('main.min.js'))
    .pipe(gulp.dest(paths.scripts.dest))
    .pipe(connect.reload());

}

function watch() {
  gulp.watch(paths.scripts.src, scripts);
  gulp.watch(paths.styles.src, styles);
  gulp.watch(paths.sass.src, dass);
  gulp.watch(paths.index, html);
}

function injectBrowserSync(){
  return gulp.src(paths.index)
  .pipe(browserSyncInject({port: 5000})) // BrowserSync will output the proxy port
  // .pipe(gulp.dest('./dist'));
  .pipe(gulp.dest('./' + directory + '/dist'));
};

function html() {
  return gulp.src(paths.index)
  .pipe(connect.reload());
}

function dass() {
  return gulp.src(['./' + directory + '/src/styles/**/*.scss', './' + directory + '/src/styles/**/*.sass'])
        .pipe(sass())
        .pipe(minifyCss())
        .pipe(gulp.dest('./' + directory + '/dist/css/' ))
        .pipe(connect.reload());
}

function index() {
  return gulp.src('./' + directory + '/index.html')
        .pipe(inject(gulp.src(['./' + directory + '/assets/**/*.js', './' + directory + '/dist/css/**/*.css'], {read: false})))
        .pipe(gulp.dest('./' + directory + '/'));
}

function server() {
  connect.server({
    root: './',
    livereload: true,
    port: 5000
  });
  gulp.watch(paths.scripts.src, scripts);
  gulp.watch(paths.sass.src, dass);
  gulp.watch(paths.styles.src, styles);
  gulp.watch(paths.index, html);
  open('http://localhost:5000/sc');
}


/*
 * Specify if tasks run in series or parallel using `gulp.series` and `gulp.parallel`
 */
var build = gulp.series(clean, gulp.parallel(styles, scripts, index),server);

/*
 * You can use CommonJS `exports` module notation to declare tasks
 */
exports.clean = clean;
exports.styles = styles;
exports.scripts = scripts;
exports.watch = watch;
exports.build = build;

exports.injectBrowserSync = injectBrowserSync;
exports.server = server;
exports.dass = dass;

/*
 * Define default task that can be called by just running `gulp` from cli
 */
exports.default = build;

/*
  function defaultTask(cb) 
  {
    cb();
  }
  exports.default = defaultTask;

 */
