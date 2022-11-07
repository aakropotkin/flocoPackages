{

  inputs.packument.url   = "https://registry.npmjs.org/promise-polyfill?rev=74-aa0a356a925df6255b2aa67b837583e3";
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
    ident = "promise-polyfill";
    ldir  = "info/unscoped/p/promise-polyfill";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
