{

  inputs.packument.url   = "https://registry.npmjs.org/resize-observer-polyfill?rev=27-8f80de185ae0ce817505fc16659f67bb";
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
    ident = "resize-observer-polyfill";
    ldir  = "info/unscoped/r/resize-observer-polyfill";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
