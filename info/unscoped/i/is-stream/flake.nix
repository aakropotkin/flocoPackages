{

  inputs.packument.url   = "https://registry.npmjs.org/is-stream?rev=16-b62ce654cc9ca8c9e0c735dbb1032026";
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
    ident = "is-stream";
    ldir  = "info/unscoped/i/is-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
