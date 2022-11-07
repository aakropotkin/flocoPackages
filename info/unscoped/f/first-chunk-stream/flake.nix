{

  inputs.packument.url   = "https://registry.npmjs.org/first-chunk-stream?rev=11-66cb661470aa01914f17547c6f177f48";
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
    ident = "first-chunk-stream";
    ldir  = "info/unscoped/f/first-chunk-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
