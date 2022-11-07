{

  inputs.packument.url   = "https://registry.npmjs.org/git-clone?rev=22-879cf68223f167a72fd76872b2be4543";
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
    ident = "git-clone";
    ldir  = "info/unscoped/g/git-clone";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
