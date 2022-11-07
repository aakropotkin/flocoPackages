{

  inputs.packument.url   = "https://registry.npmjs.org/copy-descriptor?rev=4-ad7c6239aa52b888801afc23ddc09157";
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
    ident = "copy-descriptor";
    ldir  = "info/unscoped/c/copy-descriptor";
    inherit packument fetchInfo;
  } // latest';

}
