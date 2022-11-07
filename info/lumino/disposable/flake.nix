{

  inputs.packument.url   = "https://registry.npmjs.org/@lumino/disposable?rev=40-c948f92e966a23dead1d26521377a3db";
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
    scope = "@lumino";
    ident = "@lumino/disposable";
    ldir  = "info/lumino/disposable";
    inherit packument fetchInfo;
  } // latest';

}
