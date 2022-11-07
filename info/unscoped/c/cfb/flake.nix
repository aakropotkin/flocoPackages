{

  inputs.packument.url   = "https://registry.npmjs.org/cfb?rev=113-eee59422531f52f4801c10e02ad0d9d3";
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
    ident = "cfb";
    ldir  = "info/unscoped/c/cfb";
    inherit packument fetchInfo;
  } // latest';

}
