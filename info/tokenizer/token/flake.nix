{

  inputs.packument.url   = "https://registry.npmjs.org/@tokenizer/token?rev=4-aa88251edef34f73ea7e0cc2930e3d44";
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
    scope = "@tokenizer";
    ident = "@tokenizer/token";
    ldir  = "info/tokenizer/token";
    inherit packument fetchInfo;
  } // latest';

}
