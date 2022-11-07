{

  inputs.packument.url   = "https://registry.npmjs.org/fast-glob?rev=49-24c2dd7086f1e8f0d8bbb6f393adffc6";
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
    ident = "fast-glob";
    ldir  = "info/unscoped/f/fast-glob";
    inherit packument fetchInfo;
  } // latest';

}
