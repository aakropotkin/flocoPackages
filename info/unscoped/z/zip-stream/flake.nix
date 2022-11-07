{

  inputs.packument.url   = "https://registry.npmjs.org/zip-stream?rev=72-3868ab8731f844e80cf734c46271e4f5";
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
    ident = "zip-stream";
    ldir  = "info/unscoped/z/zip-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
