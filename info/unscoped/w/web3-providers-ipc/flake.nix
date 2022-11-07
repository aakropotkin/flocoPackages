{

  inputs.packument.url   = "https://registry.npmjs.org/web3-providers-ipc?rev=117-33e40959a642b35814c18c577383c666";
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
    ident = "web3-providers-ipc";
    ldir  = "info/unscoped/w/web3-providers-ipc";
    inherit packument fetchInfo;
  } // latest';

}
