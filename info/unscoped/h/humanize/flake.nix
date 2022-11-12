{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/humanize?_rev=38-5ad2cbef247eed9f40ad81c930b8caa1";
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
    ident = "humanize";
    ldir  = "info/unscoped/h/humanize";
    inherit packument fetchInfo;
  } // latest';

}
