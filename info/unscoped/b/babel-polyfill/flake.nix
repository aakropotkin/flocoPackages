{

  inputs.packument.url   = "https://registry.npmjs.org/babel-polyfill?rev=174-fde0e16525d8721e57d0bbb89f5cbd52";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "babel-polyfill";
    ldir  = "info/unscoped/b/babel-polyfill";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
